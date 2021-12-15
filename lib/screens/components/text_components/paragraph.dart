import 'package:flutter/material.dart';
import '../../../constants.dart';

// Paragraph One
class Paragraph extends StatelessWidget {
  final String text;
  final int paragraphType;

  const Paragraph({
    Key? key,
    required this.text,
    required this.paragraphType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: paragraphType == 1 ? paragraphOne() : paragraphTwo(),
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
}
