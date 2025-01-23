import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class WhichToChooseScreen extends StatelessWidget {
  const WhichToChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Theme(
      data: ConverterTheme(color: AppColors.idrBlue).converterTheme,
      child: Scaffold(
        appBar: StyledAppbar(
          title: const Text("What's the Difference?"),
          color: AppColors.idrBlue
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
                    StyledTitleBuildVu(text: "PDF to HTML/ SVG - BuildVu"),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "This converter can convert PDF to standalone HTML content or SVG. It’s powered by our product BuildVu."),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "BuildVu is for customers who want to convert many PDF files to HTML automatically as part of their workflow. It is a Java application which can be run from any computer language. You can convert from command line (the most popular way to run BuildVu!), or use it as a simple micro-service (like how it’s implemented in this app). It can run on cloud or physical servers."),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "BuildVu is used by companies across a range of industries that includes publishing, education, finance, aerospace, recruitment, supply chain, government, healthcare, maritime and lots, lots more."),
                  ],
                ),
                SizedBox(height: h*0.04,),
                ColorfulBgBtn(
                  color: AppColors.buildvuPrimary,
                  onPressed: (){
                    launchURL('https://www.idrsolutions.com/buildvu/');
                  }, 
                  child: StyledTitleWhite(text: 'LEARN MORE ABOUT BUILDVU')
                ),
                SizedBox(height: h*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledTitleFormVu(text: "Fillable PDF to HTML - FormVu"),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "This converter can convert fillable PDF to HTML content. It’s powered by our product FormVu."),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "While BuildVu can handle most interactive annotations, if you are looking to let your users fill in PDF forms on the website, FormVu is a closer fit to your needs."),
                    SizedBox(height: h*0.02,),
                    StyledText(text: "Similar to BuildVu, FormVu is also a Java application that can be used from command line or as a simple micro-service, and can run on cloud or physical servers. With FormVu, you can easily integrate conversion into your apps, giving users on any browsers the same experience while filling out forms."),
                  ],
                ),
                SizedBox(height: h*0.04,),
                ColorfulBgBtn(
                  color: AppColors.formvuPrimary,
                  onPressed: (){
                    launchURL('https://www.idrsolutions.com/formvu/');
                  }, 
                  child: StyledTitleWhite(text: 'LEARN MORE ABOUT FORMVU')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}