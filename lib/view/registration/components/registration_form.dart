import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/email_text_field.dart';
import 'package:e_gordon/view/components/password_field.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/rounded_textform_field.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late FocusNode emailNode;
  late FocusNode passwordNode;

  final _authService = AuthService();

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
            // [START Submit Button]
            RoundedButton(
              text: "Register",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String? response = await _authService.createAccount(
                    emailController.text,
                    passwordController.text,
                  );

                  if (response == "Success") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Success"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(response),
                    ));
                  }
                }
              },
            )
            // [END Submit Button]
          ],
        ),
      ),
    );
  }
}
