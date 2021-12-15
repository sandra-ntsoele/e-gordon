import 'package:e_gordon/screens/components/main_text.dart';
import 'package:e_gordon/screens/components/text_styles/paragraph.dart';
import 'package:e_gordon/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:e_gordon/screens/components/rounded_button.dart';
import 'package:e_gordon/constants.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/onboarding-old.png'),
          // SECTION: Text
          MainText(displayText: "e-Gordon"),
          SizedBox(
            height: size.height * 0.03,
          ),
          const Paragraph(
            text: "Don't just stand there like a big fucking muffin.",
            paragraphType: 2,
          ),
          Container(
            margin: const EdgeInsets.only(top: 72),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: RoundedButton(
              text: "Start cooking",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
