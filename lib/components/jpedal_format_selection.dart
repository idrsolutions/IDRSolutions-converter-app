import 'package:converter/models/conversion_formats.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/dropdowns.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class JPedalFormatSelection extends StatefulWidget {
  const JPedalFormatSelection({super.key});

  @override
  State<JPedalFormatSelection> createState() => _JPedalFormatSelectionState();
}

class _JPedalFormatSelectionState extends State<JPedalFormatSelection> {
  final TextEditingController jpedalOriginalFormatController = TextEditingController();
  final TextEditingController jpedalConvertedFormatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyledTitle(text: 'PDF/ Word/ PowerPoint/ Excel to Image', color: AppColors.jpedalPrimary,),
        
        const SizedBox(height: 20,),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     // original format dropdown
        //     Flexible(
        //       child: StyledDropdown<JPedalOriginalFormats>(
        //         label: const Text('Original Format'), 
        //         initialSelection: JPedalOriginalFormats.pdf, 
        //         controller: jpedalOriginalFormatController, 
        //         dropdownMenuEntries: JPedalOriginalFormats.entries,
        //       ),
        //     ),

        //     Flexible(child: StyledTitle(text: 'To', color: AppColors.jpedalPrimary,)),

        //     // converted format dropdown
        //     Flexible(
        //       child: StyledDropdown<JPedalConvertedFormats>(
        //         label: const Text('Converted Format'), 
        //         initialSelection: JPedalConvertedFormats.jpg, 
        //         controller: jpedalConvertedFormatController, 
        //         dropdownMenuEntries: JPedalConvertedFormats.entries,
        //       ),
        //     ),
        //   ],
        // ),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/poweredbyjpedal.png'),
            ColorfulBgBtn(
              color: AppColors.jpedalPrimary,
              onPressed: (){},
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}