import 'package:e_gordon/view/components/form_text_field.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
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
          const Heading(
            text: "Password recovery",
            headingType: 1,
          ),
          const Paragraph(
            text: "Enter your email to recover your password",
            paragraphType: 1,
          ),
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
