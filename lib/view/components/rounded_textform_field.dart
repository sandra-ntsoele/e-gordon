import 'package:flutter/material.dart';
import '../styles.dart';

class RoundedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onEditingComplete;
  final String labelText;
  final IconData prefixIcon;
  final bool autofocus;

  const RoundedTextFormField({
    Key? key,
    required this.controller,
    this.onEditingComplete,
    required this.labelText,
    required this.prefixIcon,
    required this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //[START Textfield decoration]
      decoration: FormStyles.textFormDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      textCapitalization: TextCapitalization.words,
      autocorrect: true,
      autofocus: autofocus,
      //[END Textfield decoration]
      // [START Behaviours]
      onEditingComplete: () {
        onEditingComplete!();
      },
      // [END Behaviours]
    );
  }
}
