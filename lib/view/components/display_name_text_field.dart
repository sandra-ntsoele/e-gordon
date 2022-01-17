import 'package:flutter/material.dart';

import '../constants.dart';

class DisplayNameField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  final Function setDisplayName;

  const DisplayNameField({
    Key? key,
    required this.formKey,
    required this.textEditingController,
    required this.setDisplayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      controller: textEditingController,
      onChanged: (value) => setDisplayName(value),
    );
  }
}
