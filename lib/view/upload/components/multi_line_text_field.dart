import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  MultiLineTextField({
    Key? key,
    required this.label,
    this.fieldController,
    this.validatorFunction,
    this.onChanged,
    this.height,
  }) : super(key: key);

  final String label;
  TextEditingController? fieldController;
  String? Function(String?)? validatorFunction;
  Function(String)? onChanged;
  final height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: height ?? size.height * 0.16,
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
        style: const TextStyle(fontSize: 13),
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
