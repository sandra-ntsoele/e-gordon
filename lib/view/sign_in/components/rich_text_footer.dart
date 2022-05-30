import 'package:e_gordon/view/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../registration/registration_screen.dart';

class RichTextFooter extends StatelessWidget {
  const RichTextFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: size.height * 0.03,
      ),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            const TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontSize: paragraphTwo,
                color: mainTextColour,
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(
                fontSize: paragraphTwo,
                color: primaryColour,
                decoration: TextDecoration.none,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      )
                    },
            )
          ],
        ),
      ),
    );
  }
}
