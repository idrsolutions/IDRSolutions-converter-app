import 'package:converter/components/appbar.dart';
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

class FormvuSuccessScreen extends ConsumerWidget {
  const FormvuSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalFormat = ref.watch(formvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(formvuConvertedFileFormatProvider);
    final convertedFilePreviewURL = ref.watch(convertedFileProvider).previewURL;
    final convertedFileDownloadURL = ref.watch(convertedFileProvider).downloadURL;
    
    return Theme(
      data: ConverterTheme(color: AppColors.formvuPrimary).converterTheme, 
      child: Scaffold(
        appBar: StyledAppbar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(originalFormat),
              const Text('to'),
              Text(convertedFormat),
            ],
          ),
          color: AppColors.formvuPrimary
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
                      ClickableLogo(logoPath: 'assets/images/poweredbyformvu.png', myURL: 'https://www.idrsolutions.com/formvu/'),

                      const SizedBox(height: 20,),
                      StyledHeading(text: 'Your file is sucessfully converted!'),
                    
                      const SizedBox(height: 5,),
                      Wrap(
                        children: [
                          WhiteBgBtn(
                            onPressed: (){
                              launchURL(convertedFilePreviewURL);
                            }, 
                            child: StyledTitleFormVu(text: 'Preview Online'),
                          ),
                          const SizedBox(width: 10,),

                          WhiteBgBtn(
                            onPressed: (){
                              launchURL(convertedFileDownloadURL);
                            }, 
                            child: StyledTitleFormVu(text: 'Download Zip'),
                          ),
                          const SizedBox(width: 10,),

                          WhiteBgBtn(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: StyledTitleFormVu(text: 'Convert Another File'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      StyledText(text: 'This free online converter is powered by FormVu. FormVu is a document conversion SDK that allows developers to build HTML solutions that work with PDF Form files.'),

                      const SizedBox(height: 20,),
                      StyledTitleFormVu(
                        key: Key('businessRequirement'), // for testing
                        text: 'Business requirement to reuse PDF forms in the web browser?'
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ColorfulBgBtn(
                    onPressed: (){
                      launchURL('https://www.idrsolutions.com/formvu/');
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