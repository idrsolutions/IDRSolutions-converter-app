import 'package:converter/models/conversion_formats.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/dropdown_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class FormVuFormatSelection extends StatefulWidget {
  const FormVuFormatSelection({super.key});

  @override
  State<FormVuFormatSelection> createState() => _FormVuFormatSelectionState();
}

class _FormVuFormatSelectionState extends State<FormVuFormatSelection> {
  final TextEditingController formvuOriginalFormatController = TextEditingController();
  final TextEditingController formvuConvertedFormatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyledTitle(text: 'Fillable PDF to HTML/ HTML5', color: AppColors.FormVuPrimary,),
        
        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // original format dropdown
            StyledDropdown<FormVuOriginalFormats>(
              label: const Text('Original Format'), 
              initialSelection: FormVuOriginalFormats.pdf, 
              controller: formvuOriginalFormatController, 
              dropdownMenuEntries: FormVuOriginalFormats.entries,
            ),

            StyledTitle(text: 'To', color: AppColors.FormVuPrimary,),

            // converted format dropdown
            StyledDropdown<FormVuConvertedFormats>(
              label: const Text('Converted Format'), 
              initialSelection: FormVuConvertedFormats.html, 
              controller: formvuConvertedFormatController, 
              dropdownMenuEntries: FormVuConvertedFormats.entries,
            ),
          ],
        ),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/poweredbyformvu.png'),
            ColorfulBgBtn(
              color: AppColors.FormVuPrimary,
              onPressed: (){},
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}