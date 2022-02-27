import 'package:e_gordon/controller/profile_controller.dart';
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
      currentIndex: 1,
      selectedItemColor: primaryColour,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: smallText,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: smallText,
      ),
      onTap: (index) {
        ProfileController profileController = ProfileController();

        switch (index) {
          case 0:
            profileController.getUploadScreen(context);
            break;
          case 1:
            profileController.viewProfile();
            break;
        }
      },
    );
  }
}
