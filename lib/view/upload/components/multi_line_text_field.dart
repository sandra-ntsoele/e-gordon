import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  MultiLineTextField({
    Key? key,
    required this.label,
    this.fieldController,
    this.validatorFunction,
    this.onChanged,
  }) : super(key: key);

  final String label;
  TextEditingController? fieldController;
  String? Function(String?)? validatorFunction;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        validator: validatorFunction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: fieldController,
        autocorrect: true,
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        maxLines: null,
        onChanged: onChanged,
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
