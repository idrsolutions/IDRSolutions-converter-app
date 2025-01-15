import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
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
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: HueRingPicker(
                      pickerColor: widget.pickerColor,
                      onColorChanged: (color){
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
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            backgroundColor: widget.pickerColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            side: BorderSide(
              color: AppColors.dimmedBlack,
            ),
          ),
          child: StyledTitleSmall(
            text: 'Color Picker',
            color: AppColors.dimmedBlack,
          ),
        ),
      ],
    );
  }
}
