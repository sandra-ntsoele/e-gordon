import 'package:e_gordon/custom_theme.dart';
import 'package:e_gordon/services/supabase.dart';
import 'package:e_gordon/view/explore_page/components/category_chip_list_view.dart';
import 'package:e_gordon/view/explore_page/components/horizontal_list_view.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:flutter/material.dart';
import 'components/recipe_collection_list_view.dart';

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
  var supabaseHelper = SupabaseHelper();

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
    var stream = supabaseHelper.getSupabaseStream("diets", "diet");
    return FutureBuilder(
      future: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: CustomTheme.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const HorizontalListView(),
                CategoryChipListView(onSelected: selectedCategory),
                RecipeCollectionListView(filter: recipeFilter),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: CustomTheme.secondaryBittersweet,
            ),
          );
        }
      },
    );
  }
}
