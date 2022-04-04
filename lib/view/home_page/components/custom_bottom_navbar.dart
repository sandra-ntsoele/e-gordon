import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  final Function(int) onTap;

  const CustomBottomNavbar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BottomAppBar(
      // [START BottomAppBar Styling]
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      clipBehavior: Clip.antiAlias,
      // [END BottomAppBar Styling]

      child: BottomNavigationBar(
        onTap: (itemIndex) {
          setState(() {
            widget.onTap(itemIndex);
            currentIndex = itemIndex;
          });
        },
        currentIndex: currentIndex,
        // [START NavBar Styling]
        backgroundColor: ColourStyles.white,
        iconSize: size.height * 0.03,
        selectedItemColor: primaryColour,
        unselectedItemColor: outlineColour,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        // [END NavBar Styling]

        // [START Navbar items]
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "To-Buy",
          )
        ],
        // [END Navbar items]
      ),
    );
  }
}
