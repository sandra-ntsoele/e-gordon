import 'package:e_gordon/controller/user_controller.dart';
import 'package:e_gordon/controller/validator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class EmailTextField extends StatelessWidget {
  GlobalKey<FormState>? formKey;

  EmailTextField({
    Key? key,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email_outlined),
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
      validator: (userInput) => UserController.validateEmail(userInput),
      onChanged: (value) => formKey!.currentState!.validate(),
    );
  }
}
