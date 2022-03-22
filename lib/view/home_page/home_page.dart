import 'package:e_gordon/view/profile/components/recipe_card.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                crossAxisCount: 2,
                children: Recipe.samples.asMap().entries.map((recipe) {
                  int index = recipe.key;
                  String name = Recipe.samples[index].name;
                  String category = Recipe.samples[index].category;
                  double duration = Recipe.samples[index].duration;
                  String imageUrl = Recipe.samples[index].imageUrl;

                  return RecipeCard(
                    recipe: name,
                    category: category,
                    duration: duration,
                    imageUrl: imageUrl,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
