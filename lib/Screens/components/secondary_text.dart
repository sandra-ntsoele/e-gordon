import 'package:e_gordon/constants.dart';
import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  String displayText;

  SecondaryText({Key? key, required this.displayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: const TextStyle(
        color: secondaryTextColour,
        fontSize: 15,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}
