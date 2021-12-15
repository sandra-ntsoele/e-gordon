import 'package:flutter/material.dart';
import '../../../constants.dart';

// Paragraph One
class Heading extends StatelessWidget {
  final String text;
  final int headingType;

  const Heading({
    Key? key,
    required this.text,
    required this.headingType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: headingStyle(headingType),
    );
  }

  TextStyle paragraphOne() {
    return const TextStyle(
      fontSize: 17,
      height: 1.5,
      color: secondaryTextColour,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle paragraphTwo() {
    return const TextStyle(
      fontSize: 15,
      height: 1.5,
      color: secondaryTextColour,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle? headingStyle(int headingType) {
    if (headingType == 1) {
      return const TextStyle(
        color: mainTextColour,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );
    } else if (headingType == 2) {
      return const TextStyle(
        color: mainTextColour,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );
    } else if (headingType == 3) {
      return const TextStyle(
        color: mainTextColour,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        height: 1.5,
      );
    }
  }
}
