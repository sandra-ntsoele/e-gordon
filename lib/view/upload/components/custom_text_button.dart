import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.bgColour,
    required this.fontColour,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Color bgColour;
  final Function() onPressed;
  final String label;
  final Color fontColour;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fontColour,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: bgColour,
        padding: const EdgeInsets.all(20),
        side: const BorderSide(
          color: Colors.transparent,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
