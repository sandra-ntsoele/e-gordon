import 'package:e_gordon/controller/auth_controller.dart';
import 'package:e_gordon/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IndexAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User? currentUser;

  const IndexAppBar({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  get preferredSize {
    return const Size.fromHeight(60);
  }

  @override
  Widget build(BuildContext context) {
    String? displayName = currentUser?.displayName?.substring(0, 1) ?? "";

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 15,
      title: Text(
        "e-gordon",
        style: CustomTheme.lightTextTheme.headlineLarge,
      ),
      actions: [
        PopupMenuButton(
          // [START Avatar Button]
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: CustomTheme.primaryEmerald,
              // TODO: Check if photo exists than render either pic or text
              child: Text(
                displayName,
                style: TextStyle(color: CustomTheme.white),
              ),
            ),
          ),
          // [END Avatar Button]
          itemBuilder: (context) {
            return const <PopupMenuEntry>[
              PopupMenuItem(
                child: Text(
                  "Profile",
                ),
                value: "/profile",
              ),
              PopupMenuItem(
                child: Text(
                  "Logout",
                ),
                value: "/sign-out",
              ),
            ];
          },
          // [START Button Behaviour]
          onSelected: (value) {
            final _authController = AuthController(context);
            String routeName = value.toString();
            if (routeName == "/sign-out") {
              _authController.signOutUser();
            } else {
              Navigator.pushNamed(context, routeName);
            }
          },
          // [END Button Behaviour]
        )
      ],
    );
  }
}
