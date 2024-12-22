import 'package:converter/screens/buildvu_converter_screen.dart';
import 'package:converter/screens/home_screen.dart';
import 'package:converter/screens/sandbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const HomeScreen(), 
      home: const BuildVuConverterScreen(),
      // home: const SingleFilepickerScreen(),
    );
  }
}
