import 'package:e_gordon/view/explore_page/components/explore_app_bar.dart';
import 'package:e_gordon/view/explore_page/components/explore_header.dart';
import 'package:e_gordon/view/explore_page/components/explore_page_body.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  static bool searchFieldIsFocused = false;
  static ExplorePageController explorePageController = ExplorePageController();

  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int recipeFilter = 0;
  selectedCategory(int userChoice) {
    setState(() => recipeFilter = userChoice);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ExploreAppBar(title: "Explore"),
      backgroundColor: ColourStyles.white,
      body: Column(
        children: [
          ExploreHeader(
            selectedCategory: selectedCategory,
          ),
          SizedBox(height: size.height * 0.03),
          ExplorePageBody(
            filter: recipeFilter,
            onTap: () => ExplorePage.searchFieldIsFocused = false,
          ),
        ],
      ),
    );
  }
}
