import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class HomePopupMenu extends StatefulWidget {
  const HomePopupMenu({Key? key}) : super(key: key);

  @override
  State<HomePopupMenu> createState() => _HomePopupMenuState();
}

class _HomePopupMenuState extends State<HomePopupMenu> {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        String route = value.toString();

        if (route == "/sign-out") {
          _authService.signOut();
          Navigator.pushNamed(context, route);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
            value: "/settings",
            child: Text("Settings"),
          ),
          const PopupMenuItem(
            value: "/profile",
            child: Text("Profile"),
          ),
          const PopupMenuItem(
            value: "/sign-out",
            child: Text("Log out"),
          ),
        ];
      },
    );
  }
}
