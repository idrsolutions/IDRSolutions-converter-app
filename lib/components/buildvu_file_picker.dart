import 'dart:io';
import 'package:converter/components/buttons.dart';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildVuFilePicker extends ConsumerStatefulWidget {
  const BuildVuFilePicker({
    super.key,
    required this.originalFormat,
  });

  final String originalFormat;

  @override
  ConsumerState<BuildVuFilePicker> createState() => _BuildVuFilePickerState();
}

class _BuildVuFilePickerState extends ConsumerState<BuildVuFilePicker> {
  late String _filePath = "";

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (mounted) {
      if (result != null) {
        // if user picked a file
        final file = File(result.files.single.path!);
        final fileFormat = file.path.split("/").last.split(".").last;

        if (fileFormat == widget.originalFormat) {
          // if user-picked file format is the selected original file format
          // set file path & update provider
          setState(() {
            _filePath = file.path;
          });
          ref.read(buildvuOriginalFileProvider.notifier).updateFile(
                path: file.path,
              );
          ref.read(buildvuOriginalFileProvider.notifier).updateFile(
                format: fileFormat,
              );
        } else {
          // if user-picked file format is NOT the selected original file format
          // warn user & update provider file path to empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong file type'),
              duration: Duration(seconds: 1),
            ),
          );
          ref.read(buildvuOriginalFileProvider.notifier).updateFile(
                path: null,
              );
        }
      } else {
        // if user did NOT pick a file, ask user to pick a file
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
    final buildvuFileProvider = ref.watch(buildvuOriginalFileProvider);

    return Column(
      children: [
        WhiteBgBtn(
          onPressed: () {
            getFile();
          },
          color: AppColors.dimmedBlack,
          child: StyledTitle(
              text: 'Select Original File', color: AppColors.dimmedBlack),
        ),
        StyledText(
            text: buildvuFileProvider.path.isEmpty
                ? ""
                : buildvuFileProvider.path.split('/').last),
      ],
    );
  }
}
