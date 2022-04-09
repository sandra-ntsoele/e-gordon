import 'package:flutter/material.dart';

class HomePopupMenu extends StatefulWidget {
  const HomePopupMenu({Key? key}) : super(key: key);

  @override
  State<HomePopupMenu> createState() => _HomePopupMenuState();
}

class _HomePopupMenuState extends State<HomePopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        Navigator.pushNamed(
          context,
          value.toString(),
        );
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
        ];
      },
    );
  }
}
