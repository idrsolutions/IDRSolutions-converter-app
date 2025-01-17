import 'package:converter/components/appbar.dart';
import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/components/formvu_format_selection.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ConverterTheme(color: AppColors.idrBlue).converterTheme,
      child: Scaffold(
        appBar: StyledAppbar(title: const Text('IDRSolutions Converter'), color: AppColors.idrBlue),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildVuFormatSelection(),
              FormVuFormatSelection(),
               ColorfulBgBtn(
                  key: Key('contactUsBtn'),
                  onPressed: (){
                    launchURL("https://www.idrsolutions.com/contact-us");
                  }, 
                  child: StyledTitleWhite(text: 'CONTACT US')
                )
            ],
          ),
        ),
      ),
    );
  }
}