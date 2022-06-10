import 'package:e_gordon/view/components/horizontal_recipe_card.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCollectionListView extends StatefulWidget {
  final int filter;

  const RecipeCollectionListView({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  State<RecipeCollectionListView> createState() =>
      _RecipeCollectionListViewState();
}

class _RecipeCollectionListViewState extends State<RecipeCollectionListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        String name;
        String category;
        double duration;
        String imageUrl;
        int rating;
        List<Widget> recipeCards = [];
        List categoryList = Recipe.categoryList();
        String selectedCategory = categoryList[widget.filter];

        name = Recipe.samples[index].name;
        category = Recipe.samples[index].category;
        duration = Recipe.samples[index].duration;
        imageUrl = Recipe.samples[index].imageUrl;
        rating = 3;

        if (category == selectedCategory) {
          return HorizontalRecipeCard(
            recipe: name,
            category: category,
            duration: duration,
            imageUrl: imageUrl,
            rating: rating,
          );
        } else /**if (selectedCategory == "All")**/ {
          return HorizontalRecipeCard(
            recipe: name,
            category: category,
            duration: duration,
            imageUrl: imageUrl,
            rating: rating,
          );
        }

        // return RecipeCard(
        //   recipe: recipe,
        //   category: category,
        //   duration: duration,
        //   imageUrl: imageUrl,
        // );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: size.height * 0.015);
      },
      itemCount: 10,
    );
    // GridView.count(
    //   shrinkWrap: true,
    //   crossAxisCount: 1,
    //   crossAxisSpacing: 15,
    //   children: _recipeCardList(widget.filter),
    // );
  }

  List<Widget> _recipeCardList(selectedCategoryIndex) {
    String name;
    String category;
    double duration;
    String imageUrl;
    List<Widget> recipeCards = [];
    List categoryList = Recipe.categoryList();
    String selectedCategory = categoryList[selectedCategoryIndex];

    for (int index = 0; index < Recipe.samples.length; index++) {
      name = Recipe.samples[index].name;
      category = Recipe.samples[index].category;
      duration = Recipe.samples[index].duration;
      imageUrl = Recipe.samples[index].imageUrl;

      if (category == selectedCategory) {
        // recipeCards.add(
        //   RecipeCard(
        //     recipe: name,
        //     category: category,
        //     duration: duration,
        //     imageUrl: imageUrl,
        //   ),
        // );
      } else if (selectedCategory == "All") {
        // recipeCards.add(
        //   RecipeCard(
        //     recipe: name,
        //     category: category,
        //     duration: duration,
        //     imageUrl: imageUrl,
        //   ),
        // );
      }
    }
    return recipeCards;
  }
}
