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
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Theme.of(context).primaryColor,
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
        color: AppColors.BuildVuPrimary,
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
        color: AppColors.FormVuPrimary,
      ),
    );
  }
}

class StyledTitleJPedal extends StatelessWidget {
  const StyledTitleJPedal({
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
        color: AppColors.JPedalPrimary,
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText({
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
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
    );
  }
}