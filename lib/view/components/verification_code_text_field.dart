import 'package:flutter/material.dart';

class VerificationCodeTextField extends StatelessWidget {
  const VerificationCodeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        counterText: "",
      ),
      textAlign: TextAlign.center,
      autofocus: true,
      maxLength: 1,
      keyboardType: TextInputType.number,
    );
  }
}
