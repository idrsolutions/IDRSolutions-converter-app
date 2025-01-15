import 'package:converter/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
  });

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final bool _displayThumbColor2 = true;
  final bool _enableAlpha2 = false;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = _colorToHex(widget.pickerColor);
  }

  String _colorToHex(Color color){
    final red = (color.r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final green = (color.g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final blue = (color.b * 255).toInt().toRadixString(16).padLeft(2, '0');

    return '#$red$green$blue';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorfulBgBtn(
          color: widget.pickerColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: HueRingPicker(
                      pickerColor: widget.pickerColor,
                      onColorChanged: (color){
                        textController.text = _colorToHex(color);
                        print(textController.text);
                        widget.onColorChanged(color);
                      },
                      enableAlpha: _enableAlpha2,
                      displayThumbColor: _displayThumbColor2,
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            'Color Picker',
            style: TextStyle(color: useWhiteForeground(widget.pickerColor) ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
