import 'package:converter/components/appbar.dart';
import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/components/formvu_format_selection.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/screens/others/which_to_choose_screen.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Theme(
      data: ConverterTheme(color: AppColors.idrBlue).converterTheme,
      child: Scaffold(
        appBar: StyledAppbar(title: const Text('IDRSolutions Converter'), color: AppColors.idrBlue),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(w*0.05, h*0.05, w*0.05, h*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildVuFormatSelection(),
                SizedBox(height: h*0.1,),
                FormVuFormatSelection(),
                SizedBox(height: h*0.1,),
                WhiteBgBtn(
                  key: Key('choiceBtn'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const WhichToChooseScreen()));
                  }, 
                  child: StyledTitle(text: 'Which One Should I Choose?')
                ),
                SizedBox(height: h*0.1,),
                ColorfulBgBtn(
                  key: Key('contactUsBtn'),
                  onPressed: (){
                    launchURL("https://www.idrsolutions.com/contact-us");
                  }, 
                  child: StyledTitleWhite(text: 'CONTACT US')
                ),
              ],
            )
          ),
        )
      ),
    );
  }
}