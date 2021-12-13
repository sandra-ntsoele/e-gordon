import 'package:flutter/material.dart';

import '../../constants.dart';

class PasswordField extends StatelessWidget {
  String? labelText;
  IconData? prefixIcon;

  PasswordField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          labelStyle: const TextStyle(color: secondaryTextColour),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: outlineColour),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: outlineColour),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        validator: (String? value) {
          if (value!.trim().isEmpty) {
            return "password is required";
          }
        },
      ),
    );
  }
}
