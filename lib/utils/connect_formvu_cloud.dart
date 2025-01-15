import 'dart:io';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/providers/polldata_state_provider.dart';
import 'package:converter/providers/response_provider.dart';
import 'package:converter/providers/tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'dart:convert' as convert;

Future<void> connectFormVuCloud(WidgetRef ref, BuildContext context) async {
  final requestResponse = ref.read(requestResponseProvider.notifier);
  final apiUrl = 'https://cloud.idrsolutions.com/cloud/formvu';
  final filePath = ref.read(formvuOriginalFileProvider).path;
  final file = File(filePath);
  final settings = {
    "org.jpedal.pdf2html.password": ref.watch(formvuOriginalFileProvider).password,
    "org.jpedal.pdf2html.imageScale": ref.watch(formvuOriginalFileProvider).scale,
    "org.jpedal.pdf2html.submitUrl": ref.watch(formvuOriginalFileProvider).submitUrl,
    "org.jpedal.pdf2html.textMode": ref.watch(formvuOriginalFileProvider).textMode,
    // TODO: single file, fileborder, fieldbg
    "org.jpedal.pdf2html.formFieldBorderHighlight": ref.watch(formvuOriginalFileProvider).fieldBorderHex,
    "org.jpedal.pdf2html.formFieldBackgroundHighlight": ref.watch(formvuOriginalFileProvider).fieldBackgroundHex,
  };

  // Prepare the request headers and form data
  final settingsJson = convert.jsonEncode(settings);
  final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
  request.fields['token'] = ref.read(formvuTokenProvider);
  request.fields['input'] = 'upload';
  request.fields['settings'] = settingsJson;

  // Add the file to the form data
  final fileBytes = await file.readAsBytes();
  final fileStream = http.ByteStream.fromBytes(fileBytes);
  final fileLength = file.lengthSync();
  final fileName = basename(filePath);

  request.files.add(http.MultipartFile(
    'file',
    fileStream,
    fileLength,
    filename: fileName,
    contentType: MediaType('application', 'pdf'),
  ));

  late String uuid;

  // Send the request to upload the file
  try {
    final response = await request.send();
    requestResponse.updateRequestResponse(code: response.statusCode);
    final responseBody = await response.stream.bytesToString();
    requestResponse.updateRequestResponse(content: responseBody);

    if (response.statusCode != 200) {
      // Check if context is still valid
      if(!context.mounted) return; 

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading file: ${response.statusCode}'),
          duration: Duration(seconds: 1),
        ),
      );
      return; 
    }

    final Map<String, dynamic> responseData = convert.jsonDecode(responseBody);
    uuid = responseData['uuid'];
  } catch (e) {
    // Check if context is still valid
    if(!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error uploading file: $e'),
        duration: Duration(seconds: 1),
      ),
    );
    return;
  }

  // Poll until done
  try {
    var pollDataNotifier = ref.read(pollDataStateProvider.notifier);

    while (true) {
      final pollResponse = await http.Request('GET', Uri.parse('$apiUrl?uuid=$uuid')).send();
      if (pollResponse.statusCode != 200) {
        // Check if context is still valid
        if(!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error Polling: ${pollResponse.statusCode}'),
            duration: Duration(seconds: 1),
          ),
        );
        return; 
      }
      final Map<String, dynamic> pollData = convert.jsonDecode(await pollResponse.stream.bytesToString());
      
      // update poll data state notifier
      pollDataNotifier.updatePollDataState(pollData['state']);
      
      if (pollData['state'] == "processed") {
        ref.read(convertedFileProvider.notifier).updateFile(previewURL: pollData['previewUrl'],);
        ref.read(convertedFileProvider.notifier).updateFile(downloadURL: pollData['downloadUrl'],);
        break;
      } else if (pollData['state'] == "error") {
        return;
      } 

      // Wait for next poll
      await Future.delayed(Duration(seconds: 1));
    }
  } catch (e) {
    // Check if context is still valid
    if(!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error polling file: $e'),
        duration: Duration(seconds: 1),
      ),
    );
    return;
  }
}