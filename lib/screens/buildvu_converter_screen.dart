import 'package:converter/components/single_file_picker.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/files_provider.dart';
import 'package:converter/providers/response_provider.dart';
import 'package:converter/screens/convert_result/buildvu_success_screen.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/connect_buildvu_cloud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildVuConverterScreen extends ConsumerStatefulWidget {
  const BuildVuConverterScreen({super.key});

  @override
  ConsumerState<BuildVuConverterScreen> createState() => _BuildVuConverterScreenState();
}

class _BuildVuConverterScreenState extends ConsumerState<BuildVuConverterScreen> {
  @override
  Widget build(BuildContext context) {
    final originalFormat = ref.watch(originalBuildVuFileFormatProvider);
    final convertedFormat = ref.watch(convertedBuildVuFileFormatProvider);
    final originalFile = ref.watch(originalFileProvider);
    final requestResponse = ref.watch(requestResponseProvider);

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
                  // buildvu logo and btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(child: Image.asset('assets/images/poweredbybuildvu.png'),),
                      
                      Flexible(
                        child: WhiteBgBtn(
                          onPressed: (){},
                          child: const StyledTitle(text: 'Why BuildVu?'),
                        ),
                      ),
                    ],
                  ),
                  
                  // select file and advanced options
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const StyledTitle(text: 'Select Original File'),

                      const SizedBox(height: 5,),
                      SingleFilePicker(originalFormat: originalFormat), 

                      const SizedBox(height: 20,),
                      const StyledTitle(text: 'Advanced Options (Optional)'),

                      const SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(originalFormat == 'pdf')
                            Column(
                              children: [
                                const StyledTitleSmall(text: 'PDF Password'),
                                const StyledTitleSmall(text: 'placeholder textbox'),
                              ],
                            ),
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'Image Scale'),
                              const StyledTitleSmall(text: 'placeholder textbox'),
                            ],
                          ),
                          
                        ],
                      ),

                      const SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'IDRViewer UI'),
                              const StyledTitleSmall(text: 'placeholder textbox'),
                            ],
                          ),
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'Text Mode'),
                              const StyledTitleSmall(text: 'placeholder textbox'),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const StyledTitleSmall(text: 'placeholder tickbox'),
                          const StyledTitleSmall(text: 'Embed Images as Base64'),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const StyledTitleSmall(text: 'placeholder tickbox'),
                          const StyledTitleSmall(text: 'Inline SVGs'),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      const StyledTitleSmall(text: '*Q&A'),
                    ],
                  ),
                  
                  const SizedBox(height: 20,),
                  ColorfulBgBtn(
                    onPressed: () {
                      // check if no file
                      if(originalFile.path.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a file'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }else{
                        connectBuildVuCloud(ref);
                        switch(requestResponse.code){
                          case 200:
                            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BuildvuSuccessScreen()));
                            break;
                          case 403:
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Access denied. Please check if you put in the correct token."),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            break;
                        }
                      }
                    }, 
                    child: StyledTitleWhite(text: 'CONVERT'),
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