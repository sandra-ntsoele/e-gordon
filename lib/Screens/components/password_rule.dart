import 'package:flutter/material.dart';
import '../../constants.dart';

class PasswordRule extends StatelessWidget {
  String rule;

  PasswordRule({
    Key? key,
    required this.rule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: outlineColour,
        ),
        Text(
          rule,
          style: const TextStyle(
            color: outlineColour,
            fontSize: paragraphOne,
            height: 2.5,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
