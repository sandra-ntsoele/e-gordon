import 'package:e_gordon/screens/components/form_text_field.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/password_field.dart';
import 'package:e_gordon/screens/components/password_rule.dart';
import 'package:e_gordon/screens/components/secondary_text.dart';
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
          // SECTION: Screen heading
          MainText(displayText: "Welcome!"),
          SecondaryText(displayText: "Please enter account details"),
          // SECTION: Input fields
          FormTextField(
            labelText: "Email or phone number",
            prefixIcon: Icons.email_outlined,
          ),
          PasswordField(
            labelText: "Password",
            prefixIcon: Icons.lock_outline,
          ),
          // SECTION: Password rules
          Column(
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
                children: [
                  PasswordRule(rule: "Atleast 8 characters,"),
                  PasswordRule(rule: "Including 1 letter,"),
                  PasswordRule(rule: "And 1 number"),
                ],
              )
            ],
          ),
          // SECTION: Submit button
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            text: "Sign Up",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}