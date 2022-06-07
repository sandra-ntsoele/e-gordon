import 'package:e_gordon/view/explore_page/components/explore_app_bar.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
import 'package:flutter/material.dart';

import '../explore_page/components/explore_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [];
  final Map _screens = {
    0: {
      "title": ExplorePage.title,
      "widget": const ExplorePage(),
    },
    1: {
      "title": ShoppingListScreen.title,
      "widget": const ShoppingListScreen(),
    }
  };
  int pageIndex = 0;

  @override
  void initState() {
    _pages.add(const ExplorePage());
    _pages.add(const ShoppingListScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExploreAppBar(title: "e-gordon"),
      backgroundColor: ColourStyles.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create_outlined),
        backgroundColor: ColourStyles.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavbar(
        onTap: (itemIndex) {
          setState(() {
            pageIndex = itemIndex;
          });
        },
      ),
      body: _pages[pageIndex],
    );
  }
}
