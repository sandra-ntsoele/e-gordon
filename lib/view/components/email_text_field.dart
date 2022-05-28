import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../styles.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onEditingComplete;
  final FocusNode? focusNode;

  const EmailTextField({
    Key? key,
    required this.controller,
    required this.onEditingComplete,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = AuthService();

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      //[START Textfield decoration]
      decoration: FormStyles.textFormDecoration(
        labelText: "E-mail",
        prefixIcon: Icons.person_pin_outlined,
      ),
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      // [START Behaviours]
      validator: (email) => _authService.validateEmail(email),
      onEditingComplete: () => onEditingComplete(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // [END Behaviours]
    );
  }
}
