import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordRule extends StatelessWidget {
  String rule;

  PasswordRule({
    Key? key,
    required this.rule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.check_circle,
          color: outlineColour,
        ),
        SizedBox(width: size.width * 0.02),
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
