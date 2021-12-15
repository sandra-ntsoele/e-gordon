import 'package:e_gordon/screens/components/form_text_field.dart';
import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/screens/components/secondary_text.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SECTION: Heading text
          MainText(displayText: "Password recovery"),
          SecondaryText(
              displayText: "Enter your email to recover your password"),
          SizedBox(height: size.height * 0.03),
          // SECTION: Input field
          FormTextField(
            labelText: "Email or phone number",
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // SECTION: Submit button
          RoundedButton(
            text: "Sign In",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
