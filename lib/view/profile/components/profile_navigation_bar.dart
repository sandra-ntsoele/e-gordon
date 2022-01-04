import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class ProfileNavigationBar extends StatelessWidget {
  const ProfileNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.create,
          ),
          label: "Upload",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
      selectedItemColor: primaryColour,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: smallText,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: smallText,
      ),
    );
  }
}
