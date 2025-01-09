import 'package:converter/components/JPedal_format_selection.dart';
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
        appBar: AppBar(
          title: const Text('IDRSolutions Converter'),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.idrBlue,
              width: 10,
            )
          ),
          elevation: 4,
        ),
        
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildVuFormatSelection(),
            
                const SizedBox(height: 50,),
            
                JPedalFormatSelection(),
            
                const SizedBox(height: 50,),
            
                FormVuFormatSelection(),

                const SizedBox(height: 50,),

                ColorfulBgBtn(
                  onPressed: (){
                    launchURL("https://www.idrsolutions.com/contact-us");
                  }, 
                  child: StyledTitleWhite(text: 'CONTACT US'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}