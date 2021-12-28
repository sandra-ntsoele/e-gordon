import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: primaryColour,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Center(
          child: Column(
            children: const [
              Heading(
                text: "My Profile",
                headingType: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
