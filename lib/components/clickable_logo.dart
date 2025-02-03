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
      onTap: () {
        launchURL(myURL);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          logoPath,
        ),
      ),
    );
  }
}
