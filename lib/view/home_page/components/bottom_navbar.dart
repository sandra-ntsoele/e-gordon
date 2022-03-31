import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required int bottomNavBarIndex,
    required this.size,
  })  : _bottomNavBarIndex = bottomNavBarIndex,
        super(key: key);

  final int _bottomNavBarIndex;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _bottomNavBarIndex,
      iconSize: size.height * 0.03,
      selectedItemColor: primaryColour,
      unselectedItemColor: outlineColour,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Recipes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: "To Buy",
        )
      ],
    );
  }
}
