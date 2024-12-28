import 'package:converter/utils/launch_url.dart';
import 'package:flutter/material.dart';

class ClickableLogo extends StatelessWidget {
  const ClickableLogo({
    super.key,
    required this.logoPath,
    required this.myURL,
  });

  final String logoPath;
  final String myURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launchURL(myURL);
      },
      child: Image.asset(logoPath),
    );
  }
}