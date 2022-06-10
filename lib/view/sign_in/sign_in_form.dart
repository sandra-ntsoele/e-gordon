import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/registration/components/social_sign_in_button.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

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
            const ResetPasswordButton(),
            SizedBox(height: size.height * 0.03),
            // [START Register Button]
            RoundedButton(
              text: _isLoading ? "Loading..." : "Login",
              onPressed: _isLoading
                  ? () => null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _isLoading = true);

                        _authController
                            .signIn(
                              emailController.text,
                              passwordController.text,
                            )
                            .then((isLoading) => setState(
                                () => _isLoading = isLoading ?? false));
                      }
                    },
              btnIcon: Icons.login_rounded,
            ),
            // [END Register Button]
            SizedBox(height: size.height * 0.03),
            // [START Reg with Google Button]
            SocialSignInBtn(
              onPressed: () => _authController.signInWithGoogle(),
              btnLabel: "Sign In With Google",
              providerLogo: "google_logo.png",
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed("/password-recovery"),
        child: Text(
          "Forgot password?",
          style: TextStyle(
            color: ColourStyles.mainText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
