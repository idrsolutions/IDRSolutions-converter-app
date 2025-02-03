import 'package:converter/components/appbar.dart';
import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/color_picker.dart';
import 'package:converter/components/dropdowns.dart';
import 'package:converter/components/formvu_file_picker.dart';
import 'package:converter/components/overlay_progress_circle.dart';
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
  ConsumerState<FormvuConverterScreen> createState() =>
      _FormvuConverterScreenState();
}

class _FormvuConverterScreenState extends ConsumerState<FormvuConverterScreen> {
  OverlayEntry? _overlayProgressCircle;
  final _pdfPasswordController = TextEditingController();
  final _imageScaleController = TextEditingController(text: "1.0");
  final _submitUrlController = TextEditingController();
  bool isSingleFileFormChecked = false;
  bool hasFieldBordersChecked = false;
  bool hasFieldBackgroundsChecked = false;
  Color defaultFieldBorderColor = Colors.white;
  Color defaultFieldBackgroundColor = Colors.white;

  String colorToHex(Color color) {
    final red = (color.r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final green = (color.g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final blue = (color.b * 255).toInt().toRadixString(16).padLeft(2, '0');

    return '#$red$green$blue';
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final originalFormat = ref.watch(formvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(formvuConvertedFileFormatProvider);
    final originalFile = ref.watch(formvuOriginalFileProvider);
    final originalFileNotifier = ref.watch(formvuOriginalFileProvider.notifier);

    return PopScope(
      onPopInvokedWithResult: (popDisposition, result) {
        // Reset the file when the user navigates back
        originalFileNotifier.updateFile(
          path: '',
        );
      },
      child: Theme(
        data: ConverterTheme(color: AppColors.formvuPrimary).converterTheme,
        child: Scaffold(
          appBar: StyledAppbar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('fillable'),
                  Text(originalFormat),
                  const Text('to'),
                  Text(convertedFormat),
                ],
              ),
              color: AppColors.formvuPrimary),
          body: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(w * 0.05, h * 0.05, w * 0.05, h * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // formvu logo and why btn
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: ClickableLogo(
                              logoPath: 'assets/images/poweredbyformvu.png',
                              myURL: 'https://www.idrsolutions.com/formvu/'),
                        ),
                        Flexible(
                          child: WhiteBgBtn(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WhyFormvuScreen()),
                              );
                            },
                            child: const StyledTitle(
                                key: Key('whyBtn'), text: 'Why FormVu?'),
                          ),
                        ),
                      ],
                    ),

                    // select file and advanced options
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.05,
                        ),
                        const StyledTitle(
                            key: Key('selectBtn'),
                            text: 'Select Original File'),

                        SizedBox(
                          height: h * 0.01,
                        ),
                        FormVuFilePicker(originalFormat: originalFormat),

                        SizedBox(
                          height: h * 0.05,
                        ),
                        Row(
                          children: [
                            StyledTitle(
                                text: 'Advanced Options',
                                color: AppColors.formvuSecondary),
                            const StyledTitle(
                              text: ' (OPTIONAL)',
                              color: Colors.red,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // password & subimt url
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'PDF Password',
                                        color: AppColors.formvuSecondary),
                                    RectangleTextField(
                                      key: Key('passwordField'),
                                      isObscureText: true,
                                      controller: _pdfPasswordController,
                                      onChanged: (_) {
                                        originalFileNotifier.updateFile(
                                            password:
                                                _pdfPasswordController.text);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'Submit URL',
                                        color: AppColors.formvuSecondary),
                                    RectangleTextField(
                                      key: Key('urlField'),
                                      controller: _submitUrlController,
                                      onChanged: (_) {
                                        originalFileNotifier.updateFile(
                                            submitUrl:
                                                _submitUrlController.text);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Spacer(),

                            // scale & text mode
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'Image Scale',
                                        color: AppColors.formvuSecondary),
                                    RectangleTextField(
                                      key: Key(
                                          'imgScaleTextField'), // for testing
                                      keyboardType: TextInputType.number,
                                      controller: _imageScaleController,
                                      onChanged: (val) {
                                        if (val.isNotEmpty) {
                                          try {
                                            // attempt to parse the value to a double
                                            double parsedVal =
                                                double.parse(val);

                                            // limit user input range
                                            if (parsedVal > 10.0) {
                                              _imageScaleController.text =
                                                  "10.0";
                                              parsedVal = 10.0;
                                            } else if (parsedVal < 1) {
                                              _imageScaleController.text = "1";
                                              parsedVal = 1;
                                            }

                                            // update file detail
                                            originalFileNotifier.updateFile(
                                                scale: parsedVal);
                                          } catch (e) {
                                            // if parse failed, clear the text and warn user to put in double
                                            _imageScaleController.text = "";
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Invalid input. Please put in numbers between 1-10'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'Text Mode',
                                        color: AppColors.formvuSecondary),
                                    StyledDropdownBtn(
                                        key: Key('textModeDropDown'),
                                        dropdownList: textModes,
                                        onChanged: (newVal) {
                                          if (newVal == "Real Text") {
                                            originalFileNotifier.updateFile(
                                                textMode: "svg_realtext");
                                          } else {
                                            originalFileNotifier.updateFile(
                                                textMode:
                                                    "svg_shapetext_selectable");
                                          }
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // single file form
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            StyledCheckbox(
                              isChecked: isSingleFileFormChecked,
                              onChanged: (newVal) {
                                setState(() {
                                  isSingleFileFormChecked = newVal;
                                });
                                originalFileNotifier.updateFile(
                                    isSingleFileForm: newVal);
                              },
                            ),
                            StyledTitleSmall(
                                text: 'Single File Form',
                                color: AppColors.formvuSecondary),
                          ],
                        ),

                        // field border color
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            ColorPicker(
                                key: Key('borderColorPicker'),
                                pickerColor: defaultFieldBorderColor,
                                onColorChanged: (Color color) {
                                  setState(() {
                                    defaultFieldBorderColor = color;
                                    originalFileNotifier.updateFile(
                                        fieldBorderHex: colorToHex(
                                            defaultFieldBorderColor));
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            StyledTitleSmall(
                                text: 'Field Border Color',
                                color: AppColors.formvuSecondary),
                          ],
                        ),

                        // field background color
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            ColorPicker(
                                key: Key('backgroundColorPicker'),
                                pickerColor: defaultFieldBackgroundColor,
                                onColorChanged: (Color color) {
                                  setState(() {
                                    defaultFieldBackgroundColor = color;
                                    originalFileNotifier.updateFile(
                                        fieldBackgroundHex: colorToHex(
                                            defaultFieldBackgroundColor));
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            StyledTitleSmall(
                                text: 'Field Background Color',
                                color: AppColors.formvuSecondary),
                          ],
                        ),
                      ],
                    ),

                    // CONVERT btn
                    SizedBox(
                      height: h * 0.04,
                    ),
                    ColorfulBgBtn(
                      onPressed: () async {
                        // check if no file
                        if (originalFile.path.isEmpty) {
                          // if user has NOT selected a file, warn user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a file'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          // if user has selected a file, check if the file is the desired format
                          var appBarFormat = ref
                              .read(formvuOriginalFileFormatProvider.notifier)
                              .state;
                          var selectedFormat =
                              ref.read(formvuOriginalFileProvider).format;

                          if (appBarFormat != selectedFormat) {
                            // if the file is NOT the desired format, warn user
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Wrong file type'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            // if the file is the desired format, progress animation
                            _overlayProgressCircle = OverlayProgressCircle
                                .createOverlayProgressCircle();
                            Overlay.of(context).insert(_overlayProgressCircle!);

                            // convert
                            try {
                              await connectFormVuCloud(ref, context);
                              final updatedResponse =
                                  ref.read(requestResponseProvider);
                              if (context.mounted) {
                                if (updatedResponse.code != 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(updatedResponse.content!),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                } else {
                                  // print("password upon clicking convert btn:");
                                  // print(ref.watch(formvuOriginalFileProvider).password);
                                  if (ref.read(pollDataStateProvider) ==
                                      "error") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Can't convert. Please check your settings and if the file is fillable."),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const FormvuSuccessScreen()));
                                }
                              }
                            } finally {
                              // clear animation
                              _overlayProgressCircle?.remove();
                              _overlayProgressCircle = null;
                              // reset password
                              _pdfPasswordController.clear();
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
      ),
    );
  }
}
