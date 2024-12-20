import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/converter_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ConverterTheme(color: AppColors.IDRBlue).converterTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IDRSolutions Converter'),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.IDRBlue,
              width: 10,
            )
          ),
          elevation: 4,
        ),
        
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildVuFormatSelection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}