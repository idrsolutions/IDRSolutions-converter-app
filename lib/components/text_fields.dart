import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class TokenTextField extends StatelessWidget {
  const TokenTextField({
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

class RectangleTextField extends StatelessWidget {
  const RectangleTextField({
    super.key,
    this.isObscureText = false,
  });

  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 30,
      child: TextField(
        obscureText: isObscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.dimmedBlack),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.dimmedBlack),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
        ),
      ),
    );
  }
}