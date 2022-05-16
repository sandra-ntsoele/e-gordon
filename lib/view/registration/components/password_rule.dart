import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class PasswordRule extends StatelessWidget {
  final String rule;

  const PasswordRule({
    Key? key,
    required this.rule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.check_circle,
          color: ColourStyles.outline,
        ),
        SizedBox(width: size.width * 0.02),
        Text(
          rule,
          style: TextStyle(
            color: ColourStyles.outline,
            fontSize: paragraphOne,
            height: 2.5,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
