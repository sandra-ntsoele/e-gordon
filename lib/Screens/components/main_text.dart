import 'package:e_gordon/constants.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  String displayText;

  MainText({Key? key, required this.displayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: const TextStyle(
        color: mainTextColour,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}
