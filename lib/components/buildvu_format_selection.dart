import 'package:converter/components/buttons.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/dropdowns.dart';
import 'package:converter/models/conversion_formats.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/screens/token/buildvu_token_screen.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildVuFormatSelection extends ConsumerStatefulWidget {
  const BuildVuFormatSelection({super.key});

  @override
  ConsumerState<BuildVuFormatSelection> createState() => _BuildVuFormatSelectionState();
}

class _BuildVuFormatSelectionState extends ConsumerState<BuildVuFormatSelection> {
  final TextEditingController buildvuOriginalFormatController = TextEditingController();
  final TextEditingController buildvuConvertedFormatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyledTitle(text: 'PDF/ Word/ PowerPoint/ Excel to HTML/ SVG', color: AppColors.buildvuPrimary,),
        
        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // original format dropdown
            Flexible(
              child: StyledDropdown<BuildVuOriginalFormats>(
                key: Key('originalFormatDropdown'), // for ui testing
                label: const Text('Original Format'), 
                initialSelection: BuildVuOriginalFormats.pdf, 
                controller: buildvuOriginalFormatController, 
                dropdownMenuEntries: BuildVuOriginalFormats.entries,
                onChanged: (newValue){
                  if(newValue != null) {
                    ref.read(buildvuOriginalFileFormatProvider.notifier).state = newValue.name;
                  }
                },
              ),
            ),

            Flexible(child: StyledTitle(text: 'To', color: AppColors.buildvuPrimary,)),

            // converted format dropdown
            Flexible(
              child: StyledDropdown<BuildVuConvertedFormats>(
                key: Key('convertedFormatDropdown'), // for ui testing
                label: const Text('Converted Format'), 
                initialSelection: BuildVuConvertedFormats.html, 
                controller: buildvuConvertedFormatController, 
                dropdownMenuEntries: BuildVuConvertedFormats.entries,
                onChanged: (newValue){
                  if(newValue != null) {
                    ref.read(buildvuConvertedFileFormatProvider.notifier).state = newValue.name;
                  }
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 20,),

        // logo and GO btn
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClickableLogo(
              key: Key('buildvuLogo'), // for ui testing
              logoPath: 'assets/images/poweredbybuildvu.png', 
              myURL: 'https://www.idrsolutions.com/buildvu/'
            ),
            ColorfulBgBtn(
              color: AppColors.buildvuPrimary,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BuildvuTokenScreen()));
              },
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}