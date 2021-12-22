import 'package:e_gordon/controller/validator.dart';
import 'package:e_gordon/view/components/form_text_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/password_rule.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SECTION: Screen heading
                  const Heading(
                    text: "Welcome!",
                    headingType: 1,
                  ),
                  const Paragraph(
                    text: "Please enter account details",
                    paragraphType: 2,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // SECTION: Input fields
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 25,
                    ),
                    child: Column(
                      children: [
                        FormTextField(
                          formKey: _formKey,
                          labelText: "Email or phone number",
                          prefixIcon: Icons.email_outlined,
                          validationLogic: (userInput) =>
                              Validator.validateEmail(userInput),
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
                  // SECTION: Password rules
                  Padding(
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
                          children: [
                            PasswordRule(rule: "Atleast 8 characters,"),
                            PasswordRule(rule: "Including 1 letter,"),
                            PasswordRule(rule: "And 1 number"),
                          ],
                        )
                      ],
                    ),
                  ),
                  // SECTION: Submit button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: size.height * 0.03,
                    ),
                    child: RoundedButton(
                      text: "Sign Up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Success');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}