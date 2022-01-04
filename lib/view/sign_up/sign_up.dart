import 'package:e_gordon/controller/user_controller.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/password_rule.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
                  Heading(
                    text: "Welcome!",
                    headingType: 1,
                    overflow: false,
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
                        EmailTextField(
                          formKey: _formKey,
                          textEditingController: emailController,
                        ),
                        SizedBox(height: size.height * 0.03),
                        PasswordField(
                          formKey: _formKey,
                          textEditingController: passwordController,
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
                          children: const [
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
                      onPressed: () => UserController.registerUser(
                        context,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
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
