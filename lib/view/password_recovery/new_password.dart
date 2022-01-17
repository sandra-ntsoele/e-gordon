import 'package:e_gordon/view/components/password_rule.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';

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
          Heading(
            text: "Reset your password",
            headingType: 1,
            overflow: false,
          ),
          const Paragraph(
            text: "Please enter your new password",
            paragraphType: 1,
          ),
          SizedBox(height: size.height * 0.03),
          // SECTION: New password Input field
          // EmailTextField(
          //   labelText: "Password",
          //   prefixIcon: Icons.lock_outline,
          // ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // SECTION: Password rules
          Column(
            children: const [
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
