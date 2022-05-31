import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/registration/components/screen_header.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _authController = AuthController(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        padding: LayoutStyles.completePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ScreenHeader(
              title: "Password recovery",
              subtitle: "Enter your email to recover your password",
            ),
            SizedBox(height: size.height * 0.03),
            EmailTextField(
              controller: emailController,
              onEditingComplete: () {
                setState(() => _isLoading = true);
                _authController.resetPassword();
              },
            ),
            SizedBox(height: size.height * 0.06),
            // SECTION: Submit button
            RoundedButton(
              text: "Send link to email",
              // onPressed: () => _authController.resetPassword(),
              onPressed: () => Navigator.of(context).pushNamed("/new-password"),
            )
          ],
        ),
      ),
    );
  }
}
