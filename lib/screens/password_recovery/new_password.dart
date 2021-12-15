import 'package:e_gordon/screens/components/form_text_field.dart';
import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/password_rule.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/screens/components/secondary_text.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SECTION: Heading Text
          MainText(displayText: "Reset your password"),
          SecondaryText(displayText: "Please enter your new password"),
          SizedBox(height: size.height * 0.03),
          // SECTION: New password Input field
          FormTextField(
            labelText: "Password",
            prefixIcon: Icons.lock_outline,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // SECTION: Password rules
          Column(
            children: [
              PasswordRule(rule: "Atleast 8 characters,"),
              PasswordRule(rule: "Including 1 letter,"),
              PasswordRule(rule: "And 1 number"),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // SECTION: Submission button
          RoundedButton(
            text: "Done",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
