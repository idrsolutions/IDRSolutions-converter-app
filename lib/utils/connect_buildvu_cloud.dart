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

Future<void> connectBuildVuCloud(WidgetRef ref, BuildContext context) async {
  print('connectBuildVuCloud()!');

  final requestResponse = ref.read(requestResponseProvider.notifier);
  final apiUrl = 'https://cloud.idrsolutions.com/cloud/buildvu';
  final filePath = ref.read(buildvuOriginalFileProvider).path;
  final file = File(filePath);
  final settings = {
    "org.jpedal.pdf2html.password": ref.watch(buildvuOriginalFileProvider).password,
    "org.jpedal.pdf2html.imageScale": ref.watch(buildvuOriginalFileProvider).scale,
    "org.jpedal.pdf2html.viewerUI": ref.watch(buildvuOriginalFileProvider).ui,
    "org.jpedal.pdf2html.textMode": ref.watch(buildvuOriginalFileProvider).textMode,
    "org.jpedal.pdf2html.embedImagesAsBase64Stream": ref.watch(buildvuOriginalFileProvider).isEmbedImage,
  };

  // Prepare the request headers and form data
  final settingsJson = convert.jsonEncode(settings);
  final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
  request.fields['token'] = ref.read(buildvuTokenProvider);
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
      print('Error uploading file: ${response.statusCode}');
      return; // Exit if upload fails
    }

    final Map<String, dynamic> responseData = convert.jsonDecode(responseBody);
    uuid = responseData['uuid'];
    print('File uploaded successfully!');
  } catch (e) {
    print('Error uploading file: $e');
    return; // Exit if upload fails
  }

  // Poll until done
  try {
    var pollDataNotifier = ref.read(pollDataStateProvider.notifier);

    while (true) {
      final pollResponse = await http.Request('GET', Uri.parse('$apiUrl?uuid=$uuid')).send();
      if (pollResponse.statusCode != 200) {
        print('Error Polling: ${pollResponse.statusCode}');
        return; // TODO: Gracefully prompt instead of exit if polling fails
      }
      final Map<String, dynamic> pollData = convert.jsonDecode(await pollResponse.stream.bytesToString());
      
      // update poll data state notifier
      pollDataNotifier.updatePollDataState(pollData['state']);
      
      if (pollData['state'] == "processed") {
        ref.read(convertedFileProvider.notifier).updateFile(previewURL: pollData['previewUrl'],);
        print("Preview URL: ${ref.watch(convertedFileProvider).previewURL}");
        ref.read(convertedFileProvider.notifier).updateFile(downloadURL: pollData['downloadUrl'],);
        print("Download URL: ${ref.watch(convertedFileProvider).downloadURL}");
        break;
      } else if (pollData['state'] == "error") {
        return;// TODO: Gracefully prompt instead of exit if polling fails
      } else {
        print("Polling: ${pollData['state']}");
      }

      // Wait for next poll
      await Future.delayed(Duration(seconds: 1));
    }
  } catch (e) {
    print('Error polling file: $e');
    return;// TODO: Gracefully prompt instead of exit if polling fails
  }
}