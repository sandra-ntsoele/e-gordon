import 'package:e_gordon/view/components/recipe_card.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCardsGridView extends StatefulWidget {
  final int filter;

  const RecipeCardsGridView({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  State<RecipeCardsGridView> createState() => _RecipeCardsGridViewState();
}

class _RecipeCardsGridViewState extends State<RecipeCardsGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      children: _recipeCardList(widget.filter),
    );
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
        recipeCards.add(
          RecipeCard(
            recipe: name,
            category: category,
            duration: duration,
            imageUrl: imageUrl,
          ),
        );
      } else if (selectedCategory == "All") {
        recipeCards.add(
          RecipeCard(
            recipe: name,
            category: category,
            duration: duration,
            imageUrl: imageUrl,
          ),
        );
      }
    }
    return recipeCards;
  }
}
