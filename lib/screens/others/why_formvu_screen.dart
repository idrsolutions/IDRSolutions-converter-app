import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class WhyFormvuScreen extends StatelessWidget {
  const WhyFormvuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Theme(
      data: ConverterTheme(color: AppColors.formvuPrimary).converterTheme,
      child: Scaffold(
        appBar: StyledAppbar(
            title: const Text('Why FormVu?'), color: AppColors.formvuPrimary),
        body: Container(
          padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.02, w * 0.05, h * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledTitleFormVu(
                        text: "PDF Form conversion for developers"),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    StyledText(
                        text:
                            "Looking for a PDF converter that supports forms? FormVu is purpose-built for PDF forms, converting them to HTML for use in the web browser. Converted PDF forms retain their appearance and interaction. Data can be saved to the original file or captured via web API."),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    StyledTitleFormVu(text: "Create powerful workflows"),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    StyledText(
                        text:
                            "PDF forms can be easily and securely integrated into a web application workflow while retaining all their interaction and functionality."),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    StyledTitleFormVu(text: "For developers"),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    StyledText(
                        text:
                            "FormVu is strictly for developers. Add Form viewing functionality to your web application or create a solution that can parse PDF forms as HTML."),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    StyledTitleFormVu(text: "AEM Alternative"),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    StyledText(
                        text:
                            "FormVu is a simple and cost-effective alternative to heavyweight alternatives. Convert PDF forms to simple HTML and host it on your own servers."),
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                ColorfulBgBtn(
                    onPressed: () {
                      launchURL('https://www.idrsolutions.com/formvu/');
                    },
                    child: StyledTitleWhite(text: 'LEARN MORE')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
