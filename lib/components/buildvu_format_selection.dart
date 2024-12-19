import 'package:converter/models/conversion_formats.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class BuildVuFormatSelection extends StatefulWidget {
  const BuildVuFormatSelection({super.key});

  @override
  State<BuildVuFormatSelection> createState() => _BuildVuFormatSelectionState();
}

class _BuildVuFormatSelectionState extends State<BuildVuFormatSelection> {
  final TextEditingController buildvuOriginalFormatController = TextEditingController();
  final TextEditingController buildvuConvertedFormatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const StyledTitle(text: 'PDF/ Word/ PowerPoint/ Excel to HTML/ SVG'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // original format dropdown
            DropdownMenu<BuildVuOriginalFormats>(
              label: const Text('Original Format'),
              initialSelection: BuildVuOriginalFormats.pdf,
              controller: buildvuOriginalFormatController,
              requestFocusOnTap: true,
              dropdownMenuEntries: BuildVuOriginalFormats.entries,
            ),

            const StyledTitle(text: 'To'),

            // converted format dropdown
            DropdownMenu<BuildVuConvertedFormats>(
              label: const Text('Converted Format'),
              initialSelection: BuildVuConvertedFormats.html,
              controller: buildvuConvertedFormatController,
              requestFocusOnTap: true,
              dropdownMenuEntries: BuildVuConvertedFormats.entries,
            ),
          ],
        ),
        Row(
          children: [
            Image.asset('assets/images/poweredbybuildvu.png'),
            const Text('Go'),
          ],
        ),
      ],
    );
  }
}