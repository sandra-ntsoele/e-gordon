import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/components/verification_code_text_field.dart';
import 'package:e_gordon/view/components/secondary_button.dart';
import 'package:flutter/material.dart';

class PasswordResetVerification extends StatelessWidget {
  const PasswordResetVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SECTION: Header text
          const Heading(
            text: "Check your email",
            headingType: 1,
          ),
          const Paragraph(
            text: "We've sent the code to your email",
            paragraphType: 1,
          ),
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
