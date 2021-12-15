import 'package:e_gordon/screens/components/form_text_field.dart';
import 'package:e_gordon/screens/components/password_field.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/constants.dart';
import 'package:e_gordon/screens/components/text_components/heading.dart';
import 'package:e_gordon/screens/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SECTION: Heading
            const Heading(
              text: "Welcome Back!",
              headingType: 1,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Paragraph(
              text: "Enter account details here",
              paragraphType: 2,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            /* SECTION: Input fields */
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              // Email text field
              child: Column(
                children: [
                  /** SECTION: Input Fields */
                  FormTextField(
                    labelText: "Email or phone number",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  PasswordField(
                    labelText: "Password",
                    prefixIcon: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            /* SECTION: Sign-in buttons */
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: size.height * 0.03,
              ),
              child: Column(
                children: [
                  RoundedButton(
                    text: "Login",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Paragraph(
                    text: "Or continue with",
                    paragraphType: 2,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RoundedButton(
                    text: "Google",
                    onPressed: () {},
                    btnColour: const Color.fromRGBO(222, 82, 70, 1),
                    btnIcon: Icons.email,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
