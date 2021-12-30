import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home_filled),
        backgroundColor: primaryColour,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.create_rounded),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
