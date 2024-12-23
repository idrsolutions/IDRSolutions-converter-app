import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/screens/buildvu_converter_screen.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildvuTokenScreen extends ConsumerWidget {
  const BuildvuTokenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalFormat = ref.watch(originalBuildVuFileFormatProvider);
    final convertedFormat = ref.watch(convertedBuildVuFileFormatProvider);
    
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
                StyledTitleBuildVu(text: 'placeholder text'),
                // StyledTitleBuildVu(text: "Don't have a token? Get it here", onTap: () => launchUrlString('https://www.example.com'),),
                ColorfulBgBtn(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BuildVuConverterScreen()));
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