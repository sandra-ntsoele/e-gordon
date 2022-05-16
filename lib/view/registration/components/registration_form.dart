import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();

  late FocusNode emailNode;
  late FocusNode passwordNode;

  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // [START First Name TextField]
            TextFormField(
              decoration: textFormFieldStyling(
                "First Name",
                Icons.person_pin_outlined,
              ),
              controller: fullNameController,
              autofocus: true,
              // [START TextField Behaviours]
              validator: (value) {},
              onChanged: (value) {},
              onEditingComplete: () => emailNode.requestFocus(),
              // [END TextField Behaviours]
            ),
            // [END First Name TextField]
            SizedBox(height: size.height * 0.03),
            // [START E-mail TextField]
            TextFormField(
              decoration: textFormFieldStyling("E-mail", Icons.email_outlined),
              controller: fullNameController,
              focusNode: emailNode,
              // Behaviours
              validator: (value) {},
              onChanged: (value) {},
            ),
            // [END E-mail TextField]
            SizedBox(height: size.height * 0.03),
            // [START Password TextField]
            TextFormField(
              decoration: textFormFieldStyling(
                "Password",
                Icons.lock_outline,
              ),
              controller: fullNameController,
              // Behaviours
              validator: (value) {},
              onChanged: (value) {},
            ),
            // [END Password TextField]
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "Register",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  textFormFieldStyling(String labelText, IconData prefixIcon) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      labelStyle: TextStyle(
        color: ColourStyles.secondaryText,
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(
          color: ColourStyles.outline,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(
          color: ColourStyles.outline,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColourStyles.primary,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}
