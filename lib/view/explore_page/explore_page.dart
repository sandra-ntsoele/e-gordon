import 'package:e_gordon/custom_theme.dart';
import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/explore_page/components/category_chip_builder.dart';
import 'package:e_gordon/view/explore_page/components/main_recipe_card.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/recipe_cards_grid_view.dart';

class ExplorePage extends StatefulWidget {
  static bool searchFieldIsFocused = false;
  static ExplorePageController explorePageController = ExplorePageController();
  static String title = "Explore";

  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  FocusNode focusNode = FocusNode();
  int recipeFilter = 0;
  final User? currentUser = AuthService().user;
  int pageIndex = 0;

  selectedCategory(int userChoice) {
    setState(() => recipeFilter = userChoice);
  }

  changeFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (currentUser == null) {
      Navigator.of(context).pushNamed("/");
    }

    return Container(
      color: CustomTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.015),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommended",
                style: CustomTheme.lightTextTheme.headlineMedium,
              ),
              SizedBox(height: size.height * 0.015),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) {
                    return Row(
                      children: [
                        const MainRecipeCard(),
                        SizedBox(width: size.width * 0.03),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          CategoryChipBuilder(onSelected: selectedCategory),
          SizedBox(height: size.height * 0.015),
          Expanded(
            flex: 2,
            child: GestureDetector(
              // onTap: unfocus search bar
              onTap: () => changeFocus,
              child: RecipeCardsGridView(
                filter: recipeFilter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
