import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const PasswordField({
    Key? key,
    required this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: true,
      // [START Behaviour]
      validator: (userInput) => authController.validatePassword(userInput),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // [END Behaviour]
      // [START Decoration]
      decoration: FormStyles.textFormDecoration(
        labelText: "Password",
        prefixIcon: Icons.lock_outline,
      ),
      // [END Decoration]
    );
  }

  // TextFormField(
  //             controller: passwordController,
  //             focusNode: passwordNode,
  //             // [START Behaviours]
  //             validator: (value) => value == null || value.isEmpty
  //                 ? "Password is required"
  //                 : null,
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             // [END Behaviours]
  //           ),
}
