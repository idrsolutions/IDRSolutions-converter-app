import 'package:converter/models/conversion_formats.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/dropdown_theme.dart';
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
        StyledTitle(text: 'PDF/ Word/ PowerPoint/ Excel to HTML/ SVG', color: AppColors.BuildVuPrimary,),
        
        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // original format dropdown
            StyledDropdown<BuildVuOriginalFormats>(
              label: const Text('Original Format'), 
              initialSelection: BuildVuOriginalFormats.pdf, 
              controller: buildvuOriginalFormatController, 
              dropdownMenuEntries: BuildVuOriginalFormats.entries,
            ),

            StyledTitle(text: 'To', color: AppColors.BuildVuPrimary,),

            // converted format dropdown
            StyledDropdown<BuildVuConvertedFormats>(
              label: const Text('Converted Format'), 
              initialSelection: BuildVuConvertedFormats.html, 
              controller: buildvuConvertedFormatController, 
              dropdownMenuEntries: BuildVuConvertedFormats.entries,
            ),
          ],
        ),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/poweredbybuildvu.png'),
            ColorfulBgBtn(
              color: AppColors.BuildVuPrimary,
              onPressed: (){},
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}