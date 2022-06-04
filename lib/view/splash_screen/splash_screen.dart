import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:e_gordon/view/components/rounded_button.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final _authService = AuthService();

  void onPressed(context, snapshot) {
    Navigator.pushNamed(
      context,
      snapshot.hasData ? "/explore" : "/register",
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: _authService.userStateStream,
      builder: (context, snapshot) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboarding-old.png'),
              SizedBox(height: size.height * 0.03),
              // [START Welcome text]
              const Heading(
                text: "e-Gordon",
                headingType: 1,
                overflow: false,
              ),
              SizedBox(height: size.height * 0.03),
              const Paragraph(
                text: "Don't just stand there\nlike a big fucking muffin.",
                paragraphType: 1,
              ),
              SizedBox(height: size.height * 0.06),
              // [END Welcome text]
              // [START CTA Button]
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: RoundedButton(
                  text: "Start cooking",
                  onPressed: snapshot.connectionState == ConnectionState.active
                      ? () => onPressed(context, snapshot)
                      : () => null,
                ),
              ),
              // [END CTA Button]
            ],
          ),
        );
      },
    );
  }
}
