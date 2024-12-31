import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class WhyBuildVuScreen extends StatelessWidget {
  const WhyBuildVuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ConverterTheme(color: AppColors.buildvuPrimary).converterTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Why BuildVu?'),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.buildvuPrimary,
              width: 10,
            )
          ),
          elevation: 4,
        ),
        
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledTitleBuildVu(text: "Document conversion for developers"),
                SizedBox(height: 5,),
                StyledText(text: "Looking for a PDF conversion SDK that you can interact with programmatically? BuildVu is a purpose-built PDF to HTML converter for developers which offers high quality conversion, low file sizes and lots of configurability."),
                SizedBox(height: 15,),
                StyledTitleBuildVu(text: "Display PDF in Web Apps"),
                SizedBox(height: 5,),
                StyledText(text: "BuildVu provides a true conversion from PDF into plain HTML. This makes it easy to display PDF files in any web application, JavaScript not required."),
                SizedBox(height: 15,),
                StyledTitleBuildVu(text: "For developers"),
                SizedBox(height: 5,),
                StyledText(text: "BuildVu is strictly for developers. Add document viewing functionality to your web application or create a solution that can parse PDF files as HTML."),
                SizedBox(height: 15,),
                StyledTitleBuildVu(text: "Parse PDF files as HTML"),
                SizedBox(height: 5,),
                StyledText(text: "Now you can easily interact with PDF files as if they are HTML - because they are! This makes it simple to parse and reuse the content programmatically."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}