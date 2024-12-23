import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  _launchURL() async {
   final Uri url = Uri.parse('https://www.idrsolutions.com/buildvu/trial-download');
   if (!await launchUrl(url)) {
      print('Could not launch $url');
      throw Exception('Could not launch $url');
    }
}

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ConverterTheme(color: AppColors.buildvuPrimary).converterTheme, 
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('sandbox'),
            ],
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.buildvuPrimary,
              width: 10
            )
          ),
        ),
        
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
            child: Column(
              children: [
                StyledTitleBuildVu(text: 'Token'),
                StyledTitleBuildVu(text: 'placeholder text'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: "Don't have a token? Get it ", color: AppColors.dimmedBlack,),
                    StyledTitle(text: "here", color: AppColors.idrBlue, onTap: _launchURL,),
                  ],
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}