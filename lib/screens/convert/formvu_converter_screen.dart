import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/dropdowns.dart';
import 'package:converter/components/overlay_progress_circle.dart';
import 'package:converter/components/single_file_picker.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/models/text_mode_formats.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/providers/polldata_state_provider.dart';
import 'package:converter/providers/response_provider.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/screens/convert_result/formvu_success_screen.dart';
import 'package:converter/screens/others/why_formvu_screen.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/connect_formvu_cloud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormvuConverterScreen extends ConsumerStatefulWidget {
  const FormvuConverterScreen({super.key});

  @override
  ConsumerState<FormvuConverterScreen> createState() => _FormvuConverterScreenState();
}

class _FormvuConverterScreenState extends ConsumerState<FormvuConverterScreen> {
  OverlayEntry? _overlayProgressCircle;
  final _pdfPasswordController = TextEditingController();
  final _imageScaleController = TextEditingController(text: "1.0");
  final _submitUrlController = TextEditingController();
  final _textModeController = TextEditingController();
  bool isSingleFileFormChecked = false;
  bool hasFieldBordersChecked = false;
  bool hasFieldBackgroundsChecked = false;

  @override
  Widget build(BuildContext context) {
    final originalFormat = ref.watch(formvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(formvuConvertedFileFormatProvider);
    final originalFile = ref.watch(formvuOriginalFileProvider);
    final originalFileNotifier = ref.watch(formvuOriginalFileProvider.notifier);
  
    return Theme(
      data: ConverterTheme(color: AppColors.formvuPrimary).converterTheme, 
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
              color: AppColors.formvuPrimary,
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
                  // formvu logo and why btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: ClickableLogo(logoPath: 'assets/images/poweredbyformvu.png', myURL: 'https://www.idrsolutions.com/formvu/'),
                      ),
                      
                      Flexible(
                        child: WhiteBgBtn(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const WhyFormvuScreen()),);
                          },
                          child: const StyledTitle(text: 'Why FormVu?'),
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

                      // password & image scale
                      const SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(originalFormat == 'pdf')
                            Column(
                              children: [
                                const StyledTitleSmall(text: 'PDF Password'),
                                RectangleTextField(
                                  isObscureText: true,
                                  controller: _pdfPasswordController,
                                  onChanged: (_){
                                    originalFileNotifier.updateFile(password: _pdfPasswordController.text);
                                  },
                                ),
                              ],
                            ),
                          if (originalFormat == 'pdf') 
                            Spacer(),
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'Image Scale'),
                              RectangleTextField(
                                key: Key('imgScaleTextField'), // for testing
                                keyboardType: TextInputType.number,
                                controller: _imageScaleController,
                                onChanged:(val){
                                  if (val.isNotEmpty) {
                                    try{
                                      // attempt to parse the value to a double
                                      double parsedVal = double.parse(val);

                                      // limit user input range
                                      if(parsedVal>10.0) {
                                        _imageScaleController.text = "10.0";
                                        parsedVal = 10.0;
                                      }else if(parsedVal<1){
                                        _imageScaleController.text = "1";
                                        parsedVal = 1;
                                      }

                                      // update file detail
                                      originalFileNotifier.updateFile(scale: parsedVal);
                                    }catch(e){
                                      // if parse failed, clear the text and warn user to put in double 
                                      _imageScaleController.text = "";
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Invalid input. Please put in numbers between 1-10'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // submit url & text mode
                      const SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'Submit URL'),
                              RectangleTextField(
                                  controller: _submitUrlController,
                                  onChanged: (_){
                                    originalFileNotifier.updateFile(submitUrl: _submitUrlController.text);
                                  },
                                ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              const StyledTitleSmall(text: 'Text Mode'),
                              StyledDropdown(
                                key: Key('textModeDropDown'), // for testing
                                initialSelection: TextModes.svgRealText, 
                                controller: _textModeController, 
                                dropdownMenuEntries: TextModes.entries, 
                                onChanged: (newVal){
                                  if(newVal.toString().split(".").last == "svgRealText"){
                                    originalFileNotifier.updateFile(textMode: "svg_realtext");
                                  }else{
                                    originalFileNotifier.updateFile(textMode: "svg_shapetext_selectable");
                                  }
                                }
                              ),
                            ],
                          ),
                        ],
                      ),

                      // single file form
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          StyledCheckbox(
                            isChecked: isSingleFileFormChecked,
                            onChanged: (newVal) {
                              setState(() {
                                isSingleFileFormChecked = newVal;
                              });
                              originalFileNotifier.updateFile(isSingleFileForm:newVal);
                            },
                          ),
                          const StyledTitleSmall(text: 'Single File Form'),
                        ],
                      ),

                      // field borders
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          StyledCheckbox(
                            isChecked: hasFieldBordersChecked,
                            onChanged: (newVal) {
                              setState(() {
                                hasFieldBordersChecked = newVal;
                              });
                              originalFileNotifier.updateFile(hasFieldBorders:newVal);
                            },
                          ),
                          const StyledTitleSmall(text: 'Field Borders'),
                        ],
                      ),

                      // field borders
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          StyledCheckbox(
                            isChecked: hasFieldBackgroundsChecked,
                            onChanged: (newVal) {
                              setState(() {
                                hasFieldBackgroundsChecked = newVal;
                              });
                              originalFileNotifier.updateFile(hasFieldBackgrounds:newVal);
                            },
                          ),
                          const StyledTitleSmall(text: 'Field Backgrounds'),
                        ],
                      ),
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
                        // if user has selected a file, check if the file is the desired format
                        var appBarFormat = ref.read(formvuOriginalFileFormatProvider.notifier).state;
                        var selectedFormat = ref.read(formvuOriginalFileProvider).format;

                        if(appBarFormat != selectedFormat){
                          // if the file is NOT the desired format, warn user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Wrong file type'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }else{
                          // if the file is the desired format, progress animation
                          _overlayProgressCircle = OverlayProgressCircle.createOverlayProgressCircle();
                          Overlay.of(context).insert(_overlayProgressCircle!);
                          
                          // convert
                          try{
                            await connectFormVuCloud(ref, context);
                            final updatedResponse = ref.read(requestResponseProvider);
                            if(context.mounted){
                              if(updatedResponse.code != 200){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(updatedResponse.content!),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }else{
                                if(ref.read(pollDataStateProvider) == "error"){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Can't convert. Please check your settings."),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const FormvuSuccessScreen()));
                              }
                            }
                            
                          }finally{
                            // clear animation
                            _overlayProgressCircle?.remove();
                            _overlayProgressCircle = null;
                            // reset password
                            _pdfPasswordController.clear();
                            originalFileNotifier.updateFile(password: "");
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