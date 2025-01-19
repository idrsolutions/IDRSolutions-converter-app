import 'package:converter/components/buttons.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/screens/token/formu_token_screen.dart';
import 'package:converter/themes/colors.dart';
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
        StyledTitle(text: 'Fillable PDF to HTML', color: AppColors.formvuPrimary,),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClickableLogo(
              key: Key('formvuLogo'), // for testing
              logoPath: 'assets/images/poweredbyformvu.png', 
              myURL: 'https://www.idrsolutions.com/formvu/'
            ),
            ColorfulBgBtn(
              key: Key('formvuGo'),
              color: AppColors.formvuPrimary,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const FormvuTokenScreen()));
              },
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}