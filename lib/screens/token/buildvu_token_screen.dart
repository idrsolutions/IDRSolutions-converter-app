import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/providers/file_formats_provider.dart';
import 'package:converter/providers/tokens_provider.dart';
import 'package:converter/screens/convert/buildvu_converter_screen.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildvuTokenScreen extends ConsumerWidget {
  const BuildvuTokenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final originalFormat = ref.watch(buildvuOriginalFileFormatProvider);
    final convertedFormat = ref.watch(buildvuConvertedFileFormatProvider);
    final tokenNotifier = ref.read(buildvuTokenProvider.notifier);
    final tokenProvider = ref.watch(buildvuTokenProvider);

    return PopScope(
      onPopInvokedWithResult: (popDisposition, result) {
        // Reset the token when the user navigates back
        tokenNotifier.updateToken('');
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
          body: Center(
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(w * 0.05, h * 0.05, w * 0.05, h * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyledHeading(text: 'Token'),

                  // token text field
                  TokenTextField(
                    onChanged: (newVal) {
                      tokenNotifier.updateToken(newVal);
                    },
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledText(
                            text: "Don't have a token? Get it ",
                            color: AppColors.dimmedBlack,
                          ),
                          StyledTitle(
                            text: "here",
                            color: AppColors.idrBlue,
                            onTap: () {
                              launchURL(
                                  'https://www.idrsolutions.com/buildvu/trial-download');
                            },
                          ),
                        ],
                      ),
                      StyledTitleBuildVu(
                        text:
                            "BuildVu-HTML and BuildVu-SVG require different tokens",
                        align: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: h * 0.08,
                  ),

                  StyledText(
                    text:
                        "*The token is at the end of your received trial link",
                    align: TextAlign.center,
                  ),
                  Flexible(
                      child: Image.asset('assets/images/buildvuToken.png')),

                  SizedBox(
                    height: h * 0.08,
                  ),

                  // continue btn
                  ColorfulBgBtn(
                      onPressed: () {
                        if (tokenProvider.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please put in your token'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => BuildVuConverterScreen()));
                        }
                      },
                      child: StyledTitleWhite(text: 'CONTINUE')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
