import 'package:flutter/material.dart';
import 'Screens/Onboarding/onboarding.dart';

void main ()
{
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Column(
          children: const [
            OnboardingImage(),
            OnboardingText(),
            GetStartedBtn()
          ],
        ),
      )
    );
  }
}