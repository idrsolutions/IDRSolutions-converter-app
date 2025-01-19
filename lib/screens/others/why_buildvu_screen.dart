import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class WhyBuildVuScreen extends StatelessWidget {
  const WhyBuildVuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Theme(
      data: ConverterTheme(color: AppColors.buildvuPrimary).converterTheme,
      child: Scaffold(
        appBar: StyledAppbar(
          title: const Text('Why BuildVu?'),
          color: AppColors.buildvuPrimary
        ),
        
        body: Container(
          padding: EdgeInsets.fromLTRB(w*0.05, h*0.02, w*0.05, h*0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledTitleBuildVu(text: "Document conversion for developers"),
                    SizedBox(height: h*0.01,),
                    StyledText(text: "Looking for a PDF conversion SDK that you can interact with programmatically? BuildVu is a purpose-built PDF to HTML converter for developers which offers high quality conversion, low file sizes and lots of configurability."),
                    SizedBox(height: h*0.04,),
                    StyledTitleBuildVu(text: "Display PDF in Web Apps"),
                    SizedBox(height: h*0.01,),
                    StyledText(text: "BuildVu provides a true conversion from PDF into plain HTML. This makes it easy to display PDF files in any web application, JavaScript not required."),
                    SizedBox(height: h*0.04,),
                    StyledTitleBuildVu(text: "For developers"),
                    SizedBox(height: h*0.01,),
                    StyledText(text: "BuildVu is strictly for developers. Add document viewing functionality to your web application or create a solution that can parse PDF files as HTML."),
                    SizedBox(height: h*0.04,),
                    StyledTitleBuildVu(text: "Parse PDF files as HTML"),
                    SizedBox(height: h*0.01,),
                    StyledText(text: "Now you can easily interact with PDF files as if they are HTML - because they are! This makes it simple to parse and reuse the content programmatically."),
                  ],
                ),
                SizedBox(height: h*0.04,),
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
    );
  }
}