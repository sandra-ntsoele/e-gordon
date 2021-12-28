import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: const Center(
          child: Heading(
            text: "My Profile",
            headingType: 1,
          ),
        ),
      ),
    );
  }
}
