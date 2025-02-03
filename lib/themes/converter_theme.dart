import 'package:flutter/material.dart';

class ConverterTheme {
  ConverterTheme({
    required this.color,
  });

  final Color color;

  ThemeData get converterTheme {
    return ThemeData(
      primaryColor: color,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: color,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: color,
            fontFamily: 'Montserrat',
            fontSize: 23,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
