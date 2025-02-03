import 'package:converter/components/appbar.dart';
import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/dropdowns.dart';
import 'package:converter/components/overlay_progress_circle.dart';
import 'package:converter/components/buildvu_file_picker.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/models/idrviewer_ui_formats.dart';
import 'package:converter/models/text_mode_formats.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/file_details_provider.dart';
import 'package:converter/providers/polldata_state_provider.dart';
import 'package:converter/providers/response_provider.dart';
import 'package:converter/screens/convert_result/buildvu_success_screen.dart';
import 'package:converter/screens/others/why_buildvu_screen.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/connect_buildvu_cloud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildVuConverterScreen extends ConsumerStatefulWidget {
  const BuildVuConverterScreen({super.key});

  @override
  ConsumerState<BuildVuConverterScreen> createState() =>
      _BuildVuConverterScreenState();
}

class _BuildVuConverterScreenState
    extends ConsumerState<BuildVuConverterScreen> {
  OverlayEntry? _overlayProgressCircle;
  final _pdfPasswordController = TextEditingController();
  final _imageScaleController = TextEditingController(text: "1.0");
  bool isEmbedImgChecked = false;
  bool isInlineSVGChecked = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final originalFormat = ref.watch(buildvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(buildvuConvertedFileFormatProvider);
    final originalFile = ref.watch(buildvuOriginalFileProvider);
    final originalFileNotifier =
        ref.watch(buildvuOriginalFileProvider.notifier);

    return PopScope(
      onPopInvokedWithResult: (popDisposition, result) {
        // Reset the file when the user navigates back
        originalFileNotifier.updateFile(
          path: '',
        );
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
              color: AppColors.buildvuPrimary),
          body: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(w * 0.05, h * 0.05, w * 0.05, h * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // buildvu logo and btn
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: ClickableLogo(
                              logoPath: 'assets/images/poweredbybuildvu.png',
                              myURL: 'https://www.idrsolutions.com/buildvu/'),
                        ),
                        Flexible(
                          child: WhiteBgBtn(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WhyBuildVuScreen()),
                              );
                            },
                            child: const StyledTitle(
                                key: Key('whyBtn'), text: 'Why BuildVu?'),
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
                        BuildVuFilePicker(originalFormat: originalFormat),

                        SizedBox(
                          height: h * 0.05,
                        ),
                        Row(
                          children: [
                            StyledTitle(
                              text: 'Advanced Options',
                              color: AppColors.buildvuSecondary,
                            ),
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
                          children: [
                            // password & ui
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'PDF Password',
                                        color: AppColors.buildvuSecondary),
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
                                  height: h * 0.01,
                                ),
                                Column(
                                  children: [
                                    StyledTitleSmall(
                                        text: 'IDRViewer UI',
                                        color: AppColors.buildvuSecondary),
                                    StyledDropdownBtn(
                                      key: Key('uiDropDown'),
                                      dropdownList: idrViewerUIs,
                                      onChanged: (newVal) {
                                        originalFileNotifier.updateFile(
                                            ui: newVal);
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
                                StyledTitleSmall(
                                    text: 'Image Scale',
                                    color: AppColors.buildvuSecondary),
                                RectangleTextField(
                                  key: Key('imgScaleTextField'), // for testing
                                  keyboardType: TextInputType.number,
                                  controller: _imageScaleController,
                                  onChanged: (val) {
                                    if (val.isNotEmpty) {
                                      try {
                                        // attempt to parse the value to a double
                                        double parsedVal = double.parse(val);

                                        // limit user input range
                                        if (parsedVal > 10.0) {
                                          _imageScaleController.text = "10.0";
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
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                StyledTitleSmall(
                                    text: 'Text Mode',
                                    color: AppColors.buildvuSecondary),
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

                        // embed img
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            StyledCheckbox(
                              isChecked: isEmbedImgChecked,
                              onChanged: (newVal) {
                                setState(() {
                                  isEmbedImgChecked = newVal;
                                });
                                originalFileNotifier.updateFile(
                                    isEmbedImage: newVal);
                              },
                            ),
                            StyledTitleSmall(
                                text: 'Embed Images as Base64',
                                color: AppColors.buildvuSecondary),
                          ],
                        ),

                        // inline svg
                        if (convertedFormat != 'svg')
                          SizedBox(
                            height: h * 0.01,
                          ),
                        if (convertedFormat != 'svg')
                          Row(
                            children: [
                              StyledCheckbox(
                                isChecked: isInlineSVGChecked,
                                onChanged: (newVal) {
                                  setState(() {
                                    isInlineSVGChecked = newVal;
                                  });
                                  originalFileNotifier.updateFile(
                                      isInlineSVG: newVal);
                                },
                              ),
                              StyledTitleSmall(
                                  text: 'Inline SVGs',
                                  color: AppColors.buildvuSecondary),
                            ],
                          ),
                      ],
                    ),

                    // CONVERT btn
                    SizedBox(
                      height: h * 0.05,
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
                              .read(buildvuOriginalFileFormatProvider.notifier)
                              .state;
                          var selectedFormat =
                              ref.read(buildvuOriginalFileProvider).format;

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
                              await connectBuildVuCloud(ref, context);
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
                                  if (ref.read(pollDataStateProvider) ==
                                      "error") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Can't convert. Please check your settings."),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const BuildvuSuccessScreen()));
                                }
                              }
                            } finally {
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
      ),
    );
  }
}
