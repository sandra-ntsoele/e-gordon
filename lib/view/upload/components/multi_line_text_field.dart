import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  MultiLineTextField({
    Key? key,
    required this.label,
    this.fieldController,
    this.validatorFunction,
  }) : super(key: key);

  final String label;
  TextEditingController? fieldController;
  String? Function(String?)? validatorFunction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      child: TextFormField(
        validator: validatorFunction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: fieldController,
        autocorrect: true,
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: secondaryTextColour,
          ),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: outlineColour,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
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
          ),
        ),
      ),
    );
  }
}
