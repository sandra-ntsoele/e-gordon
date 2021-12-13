import 'package:e_gordon/Screens/components/form_text_field.dart';
import 'package:e_gordon/Screens/components/main_text.dart';
import 'package:e_gordon/Screens/components/secondary_text.dart';
import 'package:e_gordon/constants.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
