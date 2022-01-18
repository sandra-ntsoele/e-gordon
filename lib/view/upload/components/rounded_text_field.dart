import 'package:e_gordon/controller/validator.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField({
    Key? key,
    required this.label,
    this.onChanged,
    this.fieldController,
    this.validatorFunc,
  }) : super(key: key);

  final String label;
  Function(String)? onChanged;
  TextEditingController? fieldController;
  String? Function(String?)? validatorFunc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      validator: validatorFunc,
      onChanged: onChanged,
      controller: fieldController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
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
    );
  }
}
