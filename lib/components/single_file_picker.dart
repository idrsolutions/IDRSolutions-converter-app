import 'dart:io';

import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SingleFilePicker extends StatefulWidget {
  const SingleFilePicker({
    super.key,
    required this.originalFormat, 
  });

  final String originalFormat;

  @override
  State<SingleFilePicker> createState() => _SingleFilePickerState();
}

class _SingleFilePickerState extends State<SingleFilePicker> {
  late String _fileName = ""; 

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (mounted) {
      if (result != null) { // if user picked a file
        final file = File(result.files.single.path!);
        final fileName = file.path.split("/").last;
        final fileFormat = fileName.split(".").last;

        // if user-picked file format is the original file format, set the file name
        if (fileFormat == widget.originalFormat) {  
          setState(() {
            _fileName = fileName;
          });
        } else { // otherwise tell user picked the wrong file
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong file type'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } else { // if user did not pick a file, ask user to pick a file
        if (_fileName.isEmpty) {
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
    return Column(
      children: [
        WhiteBgBtn(
          onPressed: getFile,
          color: AppColors.dimmedBlack,
          child: StyledTitle(text: 'Select Original File', color: AppColors.dimmedBlack),
        ),
        
        StyledText(text: _fileName.isEmpty ? "" : _fileName),
      ],
    );
  }
}
