import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/rounded_textform_field.dart';
import 'package:e_gordon/view/registration/components/social_sign_in_button.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late FocusNode emailNode;
  late FocusNode passwordNode;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController _authController = AuthController(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // [START First Name TextField]
            RoundedTextFormField(
              labelText: "First Name",
              prefixIcon: Icons.person_pin_outlined,
              controller: firstNameController,
              onEditingComplete: () => emailNode.requestFocus(),
              autofocus: true,
            ),
            // [END First Name TextField]
            SizedBox(height: size.height * 0.03),
            // [START E-mail TextField]
            EmailTextField(
              controller: emailController,
              focusNode: emailNode,
              onEditingComplete: () => passwordNode.requestFocus(),
            ),
            // [END E-mail TextField]
            SizedBox(height: size.height * 0.03),
            // [START Password TextField]
            PasswordField(
              controller: passwordController,
              focusNode: passwordNode,
            ),
            // [END Password TextField]
            SizedBox(height: size.height * 0.03),
            // [START Register Button]
            RoundedButton(
              text: _isLoading ? "Loading..." : "Register",
              onPressed: _isLoading
                  ? () => null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _isLoading = true);

                        _authController
                            .registerUserWithEmail(
                              firstName: firstNameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            )
                            .then((isLoading) => setState(
                                () => _isLoading = isLoading ?? false));
                      }
                    },
            ),
            // [END Register Button]
            SizedBox(height: size.height * 0.03),
            // [START Reg with Google Button]
            SocialSignInBtn(
              onPressed: () => _authController.signInWithGoogle(),
              btnLabel: "Register with Google",
              providerLogo: "google_logo.png",
            ),
          ],
        ),
      ),
    );
  }
}
