import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: headingOne,
                fontWeight: FontWeight.bold,
                color: mainTextColour,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "Enter account details here",
              style: TextStyle(
                fontSize: paragraphTwo,
                color: secondaryTextColour,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Text Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email or phone number",
                  prefixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(color: secondaryTextColour),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: outlineColour),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: outlineColour),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
            // PASSWORD Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.password),
                  labelStyle: TextStyle(color: secondaryTextColour),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: outlineColour),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: outlineColour),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // Sumision BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  RoundedButton(
                    text: "Login",
                    onPressed: () {},
                    isGhostButton: false,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Or continue with",
                    style: TextStyle(
                      fontSize: paragraphTwo,
                      color: secondaryTextColour,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  RoundedButton(
                    text: "Google",
                    onPressed: () {},
                    btnColour: const Color.fromRGBO(222, 82, 70, 1),
                    btnIcon: Icons.email,
                    isGhostButton: false,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text(
                    "Don't have any account? Sign Up",
                    style: TextStyle(
                      fontSize: paragraphTwo,
                      color: mainTextColour,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
