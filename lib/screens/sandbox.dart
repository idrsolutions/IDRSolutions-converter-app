import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

// This screen is for testing purpose
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Sandbox'),),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StyledHeading(text: 'styled heading'),
            StyledTitle(text: 'styled title'),
            StyledText(text: 'styled text'),
          ],
        )
      ),
    );
  }
}
