import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/sign_up/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = emailController.text;
    String password = passwordController.text;

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
                  // SECTION: Heading
                  Heading(
                    text: "Welcome Back!",
                    headingType: 1,
                    overflow: false,
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
                          onPressed: () => {}
                          /* UserController.signInUser(
                              context, emailController, passwordController) */
                          ,
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
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              const TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: paragraphTwo,
                                  color: mainTextColour,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(
                                  fontSize: paragraphTwo,
                                  color: primaryColour,
                                  decoration: TextDecoration.none,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp(),
                                          ),
                                        )
                                      },
                              )
                            ],
                          ),
                        )
                      ],
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
