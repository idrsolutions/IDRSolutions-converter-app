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

class BuildvuSuccessScreen extends ConsumerWidget {
  const BuildvuSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final originalFormat = ref.watch(buildvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(buildvuConvertedFileFormatProvider);
    final originalFileNotifier = ref.watch(buildvuOriginalFileProvider.notifier);
    final convertedFilePreviewURL = ref.watch(convertedFileProvider).previewURL;
    final convertedFileDownloadURL = ref.watch(convertedFileProvider).downloadURL;
    
    return PopScope(
      onPopInvokedWithResult: (popDisposition, result){
        // Reset the file when the user navigates back
        originalFileNotifier.updateFile(path: '',);
      },

      child: Theme(
        data: ConverterTheme(color: AppColors.buildvuPrimary).converterTheme, 
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
            color: AppColors.buildvuPrimary
          ),
          
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(w*0.05, h*0.04, w*0.05, h*0.04),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClickableLogo(logoPath: 'assets/images/poweredbybuildvu.png', myURL: 'https://www.idrsolutions.com/buildvu/'),
      
                        SizedBox(height: h*0.03),
                        StyledHeading(text: 'Your file is sucessfully converted!'),
                      
                        SizedBox(height: h*0.03),
                        Wrap(
                          children: [
                            WhiteBgBtn(
                              onPressed: (){
                                launchURL(convertedFilePreviewURL);
                              }, 
                              child: StyledTitleBuildVu(key: Key('previewBtn'), text: 'Preview Online'),
                            ),
                            SizedBox(width: w*0.03),
      
                            WhiteBgBtn(
                              onPressed: (){
                                launchURL(convertedFileDownloadURL);
                              }, 
                              child: StyledTitleBuildVu(key: Key('downloadBtn'), text: 'Download Zip'),
                            ),
                            SizedBox(width: w*0.03),
      
                            WhiteBgBtn(
                              onPressed: (){
                                originalFileNotifier.updateFile(path: '', password: '');
                                Navigator.pop(context);
                              }, 
                              child: StyledTitleBuildVu(key: Key('convertAnotherBtn'), text: 'Convert Another File'),
                            ),
                          ],
                        ),
      
                        SizedBox(height: h*0.03),
                        StyledText(text: 'This free mobile converter is powered by Buildvu. BuildVu is a document conversion SDK that allows developers to build HTML5 solutions that work with PDF files.'),
      
                        SizedBox(height: h*0.03),
                        StyledTitleBuildVu(
                          key: Key('businessRequirement'), // for testing
                          text: 'Business requirement to display PDF in the web browser?'
                        ),
                      ],
                    ),
                    SizedBox(height: h*0.03),
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
      ),
    );
  }
}