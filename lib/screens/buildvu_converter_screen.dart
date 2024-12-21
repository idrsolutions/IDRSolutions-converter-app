import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class BuildVuConverterScreen extends StatefulWidget {
  const BuildVuConverterScreen({super.key});

  @override
  State<BuildVuConverterScreen> createState() => _BuildVuConverterScreenState();
}

class _BuildVuConverterScreenState extends State<BuildVuConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ConverterTheme(color: AppColors.BuildVuPrimary).converterTheme, 
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('xx'),
              const Text('to'),
              const Text('xx'),
            ],
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.BuildVuPrimary,
              width: 10
            )
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
            child: Column(
              children: [
                // buildvu logo and btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/poweredbybuildvu.png'),
                    WhiteBgBtn(
                      onPressed: (){},
                      child: const StyledTitle(text: 'Why BuildVu?'),
                    ),
                  ],
                ),

                const StyledTitleBuildVu(text: 'Select File'),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}