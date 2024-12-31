import 'package:converter/components/overlay_progress_circle.dart';
import 'package:converter/components/single_file_picker.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/providers/response_provider.dart';
import 'package:converter/screens/convert_result/buildvu_success_screen.dart';
import 'package:converter/screens/others/why_buildvu_screen.dart';
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
  OverlayEntry? _overlayProgressCircle;

  @override
  Widget build(BuildContext context) {
    final originalFormat = ref.watch(buildvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(buildvuConvertedFileFormatProvider);
    final originalFile = ref.watch(buildvuOriginalFileProvider);
  
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
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const WhyBuildVuScreen()),);
                          },
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
                      if(convertedFormat != 'svg')
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
                  
                  // CONVERT btn
                  const SizedBox(height: 20,),
                  ColorfulBgBtn(
                    onPressed: () async {
                      // check if no file
                      if(originalFile.path.isEmpty){
                        // if user has NOT selected a file, warn user
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a file'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }else{
                        // if user has selected a file,
                        // check if the file is the desired format
                        var appBarFormat = ref.read(buildvuOriginalFileFormatProvider.notifier).state;
                        var selectedFormat = ref.read(buildvuOriginalFileProvider).format;

                        if(appBarFormat != selectedFormat){
                          // if the file is NOT the desired format, warn user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Wrong file type'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }else{
                          // if the file is the desired format
                          // progress animation
                          _overlayProgressCircle = OverlayProgressCircle.createOverlayProgressCircle();
                          Overlay.of(context).insert(_overlayProgressCircle!);
                          
                          // convert
                          try{
                            await connectBuildVuCloud(ref);
                            final updatedResponse = ref.read(requestResponseProvider);
                            switch(updatedResponse.code){
                              case 200:
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BuildvuSuccessScreen()));
                                break;
                              default:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(updatedResponse.content!),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                break;
                            }
                          }finally{
                            _overlayProgressCircle?.remove();
                            _overlayProgressCircle = null;
                          }
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