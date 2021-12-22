import 'package:e_gordon/controller/validator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PasswordField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?) validationLogic;

  const PasswordField({
    Key? key,
    required this.formKey,
    required this.labelText,
    required this.prefixIcon,
    required this.validationLogic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        labelStyle: const TextStyle(
          color: secondaryTextColour,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: outlineColour,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: outlineColour,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColour,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
      validator: validationLogic,
      onChanged: (value) => formKey.currentState!.validate(),
    );
  }
}
