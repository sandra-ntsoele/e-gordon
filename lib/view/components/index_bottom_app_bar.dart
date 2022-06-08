import 'package:flutter/material.dart';

class IndexBottomAppBar extends StatefulWidget {
  final Function(int) onTap;

  const IndexBottomAppBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<IndexBottomAppBar> createState() => _IndexBottomAppBarState();
}

class _IndexBottomAppBarState extends State<IndexBottomAppBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
