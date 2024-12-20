import 'package:flutter/material.dart';

class ColorfulBgBtn extends StatelessWidget {
  const ColorfulBgBtn({
    super.key,
    this.color,
    required this.onPressed,
    required this.child,
  });

  final Color? color;
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        backgroundColor: color?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        )
      ),
      child: child,
    );
  }
}

class WhiteBgBtn extends StatelessWidget {
  const WhiteBgBtn({
    super.key,
    this.color,
    required this.onPressed,
    required this.child,
  });

  final Color? color;
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        side: BorderSide(
          color: color?? Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        )
      ),
      child: child,
    );
  }
}