import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/registration/components/password_rule.dart';
import 'package:flutter/material.dart';

class PasswordRules extends StatefulWidget {
  const PasswordRules({Key? key}) : super(key: key);

  @override
  State<PasswordRules> createState() => _PasswordRulesState();
}

class _PasswordRulesState extends State<PasswordRules> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your password must contain:",
            style: TextStyle(
              color: mainTextColour,
              fontSize: paragraphOne,
              fontWeight: FontWeight.bold,
              height: 2.5,
            ),
          ),
          Column(
            children: const [
              PasswordRule(rule: "Atleast 8 characters,"),
              PasswordRule(rule: "Including 1 letter,"),
              PasswordRule(rule: "And 1 number"),
            ],
          )
        ],
      ),
    );
  }
}
