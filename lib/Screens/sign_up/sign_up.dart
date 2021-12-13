import 'package:e_gordon/Screens/components/form_text_field.dart';
import 'package:e_gordon/Screens/components/main_text.dart';
import 'package:e_gordon/Screens/components/password_rule.dart';
import 'package:e_gordon/Screens/components/secondary_text.dart';
import 'package:e_gordon/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainText(displayText: "Welcome!"),
          SecondaryText(displayText: "Please enter account details"),
          FormTextField(
            labelText: "Email or phone number",
            prefixIcon: Icons.email_outlined,
          ),
          FormTextField(
            labelText: "Password",
            prefixIcon: Icons.lock_outline,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your password must contain:",
                style: TextStyle(
                  color: mainTextColour,
                  fontSize: paragraphOne,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  PasswordRule(rule: "Atleast 8 characters,"),
                  PasswordRule(rule: "Including 1 letter,"),
                  PasswordRule(rule: "And 1 number"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
