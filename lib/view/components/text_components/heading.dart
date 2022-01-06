import 'package:flutter/material.dart';
import '../../constants.dart';

// Paragraph One
class Heading extends StatelessWidget {
  String? text;
  final int headingType;
  bool overflow;

  Heading(
      {Key? key,
      required this.text,
      required this.headingType,
      required this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "John Doe",
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
      return TextStyle(
        color: mainTextColour,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 1.5,
        overflow: overflow ? TextOverflow.ellipsis : null,
      );
    } else if (headingType == 2) {
      return TextStyle(
        color: mainTextColour,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        height: 1.5,
        overflow: overflow ? TextOverflow.ellipsis : null,
      );
    } else if (headingType == 3) {
      return TextStyle(
        color: mainTextColour,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        height: 1.5,
        overflow: overflow ? TextOverflow.ellipsis : null,
      );
    }
  }
}
