import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/secondary_button.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/components/verification_code_text_field.dart';
import 'package:flutter/material.dart';

class SignUpVerification extends StatelessWidget {
  const SignUpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SECTION: Header text
              const Heading(
                text: "Check your email",
                headingType: 1,
                overflow: false,
              ),
              const Paragraph(
                text: "We've sent the code to your email",
                paragraphType: 1,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              // SECTION: Verification text fields
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Row(children: [
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
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Column(
                  children: [
                    RoundedButton(
                      text: "Verify",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
