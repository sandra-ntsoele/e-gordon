import 'package:e_gordon/view/explore_page/components/explore_app_bar.dart';
import 'package:e_gordon/view/explore_page/components/explore_header.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  static bool searchFieldIsFocused = false;

  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  FocusNode focusNode = FocusNode();
  final ExplorePageController homePageController = ExplorePageController();

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ExploreAppBar(title: "Explore"),
      backgroundColor: ColourStyles.white,
      body: Column(
        children: [
          ExploreHeader(),
          SizedBox(height: size.height * 0.03),
          // [START Recipe list]
          Expanded(
            flex: 2,
            child: GestureDetector(
              // onTap: unfocus search bar
              onTap: () {
                setState(() {
                  ExplorePage.searchFieldIsFocused = false;
                  FocusScope.of(context).requestFocus(focusNode);
                });
              },
              child: homePageController.recipeCardGrid(selectedCategory),
            ),
          )
        ],
      ),
    );
  }
}
