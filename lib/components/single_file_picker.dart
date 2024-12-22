import 'dart:io';

import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/texts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SingleFilePicker extends StatefulWidget {
  const SingleFilePicker({super.key});

  @override
  State<SingleFilePicker> createState() => _SingleFilePickerState();
}

class _SingleFilePickerState extends State<SingleFilePicker> {
  late String _fileName = ""; 

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      final fileName = file.path.split("/").last;
      final fileFormat = fileName.split(".").last;

      if (fileFormat == "jpg") {
        setState(() {
          _fileName = fileName;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong file type')),
        );
      }
    } else {
      if(_fileName.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a file')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteBgBtn(
          onPressed: getFile,
          child: const StyledTitle(text: 'Select Original File'),
        ),
        StyledText(text: _fileName.isEmpty ? "" : _fileName),
      ],
    );
  }
}
