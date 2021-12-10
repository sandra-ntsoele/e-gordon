import 'package:e_gordon/Screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:e_gordon/Screens/widgets/long_button.dart';
import 'package:e_gordon/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(children: [
          Container(
            height: 400,
            child: Image.asset('assets/images/onboarding-old.png'),
          ),
          Column(children: [
            const Text(
              "e-Gordon",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text(
              "Don't just stand there like a big fucking muffin.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: secondaryTextColour,
              ),
            ),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 72),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: LongButton(
              text: "Start cooking",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
