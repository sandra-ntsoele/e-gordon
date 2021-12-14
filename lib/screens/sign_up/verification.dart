import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/secondary_text.dart';
import 'package:e_gordon/screens/components/verification_code_text_field.dart';
import 'package:flutter/material.dart';

class SignUpVerification extends StatelessWidget {
  const SignUpVerification({Key? key}) : super(key: key);

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
          // SECTION: Verification text fields
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
          ])
        ],
      ),
    );
  }
}
