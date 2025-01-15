import 'package:converter/components/color_picker.dart';
import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  Color currentColor = Colors.red;
  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      pickerColor: currentColor,
      onColorChanged: changeColor,
    );
  }
}