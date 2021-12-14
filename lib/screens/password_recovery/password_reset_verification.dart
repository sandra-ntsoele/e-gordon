import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/screens/components/secondary_text.dart';
import 'package:e_gordon/screens/components/verification_code_text_field.dart';
import 'package:e_gordon/screens/components/secondary_button.dart';
import 'package:flutter/material.dart';

class PasswordResetVerification extends StatelessWidget {
  const PasswordResetVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SECTION: Header text
          MainText(displayText: "Check your email"),
          SecondaryText(displayText: "We've sent the code to your email"),
          SizedBox(
            height: size.height * 0.03,
          ),
          // SECTION: Text fields for the verification code
          Row(children: [
            const Expanded(
              child: VerificationCodeTextField(),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            const Expanded(
              child: VerificationCodeTextField(),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            const Expanded(
              child: VerificationCodeTextField(),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            const Expanded(
              child: VerificationCodeTextField(),
            ),
          ]),
          SizedBox(
            height: size.height * 0.06,
          ),
          // SECTION: Submission buttons
          RoundedButton(
            text: "Next",
            onPressed: () {},
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SecondaryButton(
            text: "Send again",
            onPressed: () {},
            isGhostButton: true,
          )
        ],
      ),
    );
  }
}
