import 'package:e_gordon/controller/auth_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onEditingComplete;
  final FocusNode? focusNode;

  const EmailTextField({
    Key? key,
    required this.controller,
    required this.onEditingComplete,
    this.focusNode,
  }) : super(key: key);

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email is required";
    } else if (!EmailValidator.validate(input)) {
      return "Invalid email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      //[START Textfield decoration]
      decoration: FormStyles.textFormDecoration(
        labelText: "E-mail",
        prefixIcon: Icons.person_pin_outlined,
      ),
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      // [START Behaviours]
      validator: (email) => validateEmail(email),
      onEditingComplete: () => onEditingComplete(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // [END Behaviours]
    );
  }
}
