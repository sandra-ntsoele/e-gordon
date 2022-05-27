import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:e_gordon/view/components/rounded_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final _authState = _authService.authState;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboarding-old.png'),
            SizedBox(
              height: size.height * 0.03,
            ),
            // SECTION: Text
            Heading(
              text: "e-Gordon",
              headingType: 1,
              overflow: false,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Paragraph(
              text: "Don't just stand there\nlike a big fucking muffin.",
              paragraphType: 1,
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: RoundedButton(
                text: "Start cooking",
                onPressed: () {
                  if (_authState != null) {
                    Navigator.pushNamed(context, "/profile");
                  } else {
                    Navigator.pushNamed(context, "/register");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
