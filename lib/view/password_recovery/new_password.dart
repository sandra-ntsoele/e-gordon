import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/registration/components/screen_header.dart';
import 'package:e_gordon/view/styles.dart';

import 'package:flutter/material.dart';

import '../registration/components/password_rule.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: size.height,
          padding: LayoutStyles.completePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ScreenHeader(
                title: "Reset your password",
                subtitle: "Please enter your new password",
              ),
              SizedBox(height: size.height * 0.03),
              PasswordField(
                controller: passwordController,
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                height: size.height * 0.03,
              ),
              // SECTION: Submission button
              RoundedButton(
                text: "Reset password",
                onPressed: () {
                  _formKey.currentState!.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
