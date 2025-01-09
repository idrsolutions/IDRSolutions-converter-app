import 'package:converter/components/clickable_logo.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildvuSuccessScreen extends ConsumerWidget {
  const BuildvuSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalFormat = ref.watch(buildvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(buildvuConvertedFileFormatProvider);
    final convertedFilePreviewURL = ref.watch(convertedFileProvider).previewURL;
    final convertedFileDownloadURL = ref.watch(convertedFileProvider).downloadURL;
    
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
        
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClickableLogo(logoPath: 'assets/images/poweredbybuildvu.png', myURL: 'https://www.idrsolutions.com/buildvu/'),

                      const SizedBox(height: 20,),
                      StyledHeading(text: 'Your file is sucessfully converted!'),
                    
                      const SizedBox(height: 5,),
                      Wrap(
                        children: [
                          WhiteBgBtn(
                            onPressed: (){
                              launchURL(convertedFilePreviewURL);
                            }, 
                            child: StyledTitleBuildVu(text: 'Preview Online'),
                          ),
                          const SizedBox(width: 10,),

                          WhiteBgBtn(
                            onPressed: (){
                              launchURL(convertedFileDownloadURL);
                            }, 
                            child: StyledTitleBuildVu(text: 'Download Zip'),
                          ),
                          const SizedBox(width: 10,),

                          WhiteBgBtn(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: StyledTitleBuildVu(text: 'Convert Another File'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      StyledText(text: 'This free mobile converter is powered by Buildvu. BuildVu is a document conversion SDK that allows developers to build HTML5 solutions that work with PDF files.'),

                      const SizedBox(height: 20,),
                      StyledTitleBuildVu(text: 'Business requirement to display PDF in the web browser?'),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ColorfulBgBtn(
                    onPressed: (){
                      launchURL('https://www.idrsolutions.com/buildvu/');
                    }, 
                    child: StyledTitleWhite(text: 'LEARN MORE')
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}