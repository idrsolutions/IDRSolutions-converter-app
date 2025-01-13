import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class StyledHeading extends StatelessWidget {
  const StyledHeading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  final String text;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class StyledTitleSmall extends StatelessWidget {
  const StyledTitleSmall({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class StyledTitleWhite extends StatelessWidget {
  const StyledTitleWhite({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class StyledTitleBuildVu extends StatelessWidget {
  const StyledTitleBuildVu({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.buildvuPrimary,
      ),
    );
  }
}

class StyledTitleFormVu extends StatelessWidget {
  const StyledTitleFormVu({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.formvuPrimary,
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AppColors.dimmedBlack,
      ),
    );
  }
}