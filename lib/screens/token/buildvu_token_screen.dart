import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/tokens_provider.dart';
import 'package:converter/screens/buildvu_converter_screen.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/text_fields.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildvuTokenScreen extends ConsumerWidget {
  const BuildvuTokenScreen({super.key});

  _launchURL() async {
   final Uri url = Uri.parse('https://www.idrsolutions.com/buildvu/trial-download');
   if (!await launchUrl(url)) {
      // TODO：prompt user
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalFormat = ref.watch(originalBuildVuFileFormatProvider);
    final convertedFormat = ref.watch(convertedBuildVuFileFormatProvider);
    final tokenNotifier = ref.read(buildvuTokenProvider.notifier);
    
    return Theme(
      data: ConverterTheme(color: AppColors.buildvuPrimary).converterTheme, 
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(originalFormat),
              const Text('to'),
              Text(convertedFormat),
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
                StyledText(text: "*The token is at the end of your received trial link", color: AppColors.dimmedBlack,),
                StyledTextField(
                  onChanged: (newVal) {
                    tokenNotifier.updateToken(newVal);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(text: "Don't have a token? Get it ", color: AppColors.dimmedBlack,),
                    StyledTitle(text: "here", color: AppColors.idrBlue, onTap: _launchURL,),
                  ],
                ),
                ColorfulBgBtn(
                  // TODO: only continue when token is keyed in
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => BuildVuConverterScreen()));
                  },
                  child: StyledTitleWhite(text: 'CONTINUE')
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}