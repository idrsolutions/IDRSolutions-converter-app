import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  const StyledTextField({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 30,
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.dimmedBlack,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.dimmedBlack)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.dimmedBlack))
        ),
      ),
    );
  }
}