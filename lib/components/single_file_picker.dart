import 'dart:io';
import 'package:converter/providers/files_provider.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleFilePicker extends ConsumerStatefulWidget {
  const SingleFilePicker({
    super.key,
    required this.originalFormat, 
  });

  final String originalFormat;

  @override
  ConsumerState<SingleFilePicker> createState() => _SingleFilePickerState();
}

class _SingleFilePickerState extends ConsumerState<SingleFilePicker> {
  late String _filePath = ""; 

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (mounted) {
      if (result != null) { // if user picked a file
        final file = File(result.files.single.path!);
        final fileFormat = file.path.split("/").last.split(".").last;
        
        if (fileFormat == widget.originalFormat) {  
          // if user-picked file format is the selected original file format
          // set file path & update provider
          setState(() {
            _filePath = file.path;
          });
          ref.read(originalFileProvider.notifier).updateFile(path: file.path,);
        } else { 
          // if user-picked file format is NOT the selected original file format
          // warn user & update provider file path to empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong file type'),
              duration: Duration(seconds: 1),
            ),
          );
          ref.read(originalFileProvider.notifier).updateFile(path: null,);
        }
      } else { // if user did NOT pick a file, ask user to pick a file
        if (_filePath.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a file'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileProvider = ref.watch(originalFileProvider);

    return Column(
      children: [
        WhiteBgBtn(
          onPressed: (){
            getFile();
          },
          color: AppColors.dimmedBlack,
          child: StyledTitle(text: 'Select Original File', color: AppColors.dimmedBlack),
        ),
        
        StyledText(text: fileProvider.path.isEmpty ? "" : "${fileProvider.path}".split('/').last),
      ],
    );
  }
}
