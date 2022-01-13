import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/components/display_name.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/password_rule.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:flutter/gestures.dart';
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
  final displayNameController = TextEditingController();

  String email = "";
  String password = "";
  String displayName = "";

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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                screenHeader(size),
                inputFields(size),
                // passwordRules(),
                signUpBtn(size, context),
                loginSpan(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding loginSpan(size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            const TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                fontSize: paragraphTwo,
                color: mainTextColour,
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: "Login",
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
                          builder: (context) => const SignIn(),
                        ),
                      )
                    },
            )
          ],
        ),
      ),
    );
  }

  Padding signUpBtn(Size size, BuildContext context) {
    AuthController authController = AuthController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: size.height * 0.03,
      ),
      child: RoundedButton(
        text: "Sign Up",
        onPressed: () => authController.registerUser(
          context,
          displayName: displayName,
          email: email,
          password: password,
        ),
      ),
    );
  }

  Padding passwordRules() {
    return Padding(
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
    );
  }

  Padding inputFields(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        children: [
          DisplayNameField(
            formKey: _formKey,
            textEditingController: displayNameController,
            setDisplayName: (value) => displayName = value,
          ),
          SizedBox(height: size.height * 0.03),
          EmailTextField(
            formKey: _formKey,
            textEditingController: emailController,
            setEmail: (value) => email = value,
          ),
          SizedBox(height: size.height * 0.03),
          PasswordField(
            formKey: _formKey,
            textEditingController: passwordController,
            setPassword: (value) => password = value,
          ),
        ],
      ),
    );
  }

  Widget screenHeader(size) {
    return Column(
      children: [
        Heading(
          text: "Welcome!",
          headingType: 1,
          overflow: false,
        ),
        const Paragraph(
          text: "Please enter account details",
          paragraphType: 2,
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}
