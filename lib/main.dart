import 'package:flutter/material.dart';

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

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // const SizedBox(height: 400),
      height: 400,
      child: Image.asset('assets/images/onboarding-old.png')
    );
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children : const [
          Text(
            "e-Gordon", 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5
            ),
          ),
          Text(
            "Don't just stand there like a big fucking muffin.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Color.fromRGBO(156, 165, 162, 1),
            ),
          )
        ]
      ) 
    );
  }
}

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 72),
      width: double.infinity,
      padding: EdgeInsets.only(left: 25, right: 25),
      child : ElevatedButton(
        onPressed: () { print("clicked"); },

        child: const Text("Start Cooking"),
        
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          primary: Color.fromRGBO(31, 204, 121, 1),
          fixedSize: Size.fromHeight(56),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
        )
      )
    );
  }
}