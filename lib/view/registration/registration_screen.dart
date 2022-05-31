import 'package:e_gordon/view/registration/components/login_span.dart';
import 'package:e_gordon/view/registration/components/registration_form.dart';
import 'package:e_gordon/view/registration/components/screen_header.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ScreenHeader(
                  title: "Welcome",
                  subtitle: "Please enter account details",
                ),
                RegistrationForm(),
                LoginSpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
