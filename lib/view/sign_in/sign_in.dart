import 'package:e_gordon/view/registration/components/screen_header.dart';
import 'package:e_gordon/view/sign_in/components/rich_text_footer.dart';
import 'package:e_gordon/view/sign_in/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ScreenHeader(
                  title: "Welcome",
                  subtitle: "Please enter account details",
                ),
                SignInForm(),
                RichTextFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
