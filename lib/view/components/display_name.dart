import 'package:e_gordon/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class FullNameField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;

  const FullNameField({
    Key? key,
    required this.formKey,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();

    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Full name",
        prefixIcon: Icon(Icons.person_pin_outlined),
        labelStyle: TextStyle(
          color: secondaryTextColour,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: outlineColour,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: outlineColour,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColour,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
      validator: (userInput) => authController.validateEmail(userInput),
      onChanged: (value) => formKey.currentState!.validate(),
      controller: textEditingController,
    );
  }
}
