import 'package:e_gordon/view/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginSpan extends StatelessWidget {
  const LoginSpan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            const TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                fontSize: paragraphTwo,
                color: mainTextColour,
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: "Login",
              style: const TextStyle(
                fontSize: paragraphTwo,
                color: primaryColour,
                decoration: TextDecoration.none,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.of(context).pushNamed("/login"),
            )
          ],
        ),
      ),
    );
  }
}
