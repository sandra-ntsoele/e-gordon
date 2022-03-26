import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/profile/components/recipe_card.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

import 'components/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode focusNode = FocusNode();
  bool fieldIsTapped = false;
  final searchBarController = TextEditingController();
  LayoutStyles styles = LayoutStyles();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /* Search bar and categories container */
            Container(
              // Container styling
              padding: LayoutStyles.completePadding,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: ColourStyles.lightGray,
                    width: size.width * 0.03,
                  ),
                ),
              ),
              child: Row(
                children: [
                  if (fieldIsTapped)
                    // [START Search box back/return button]
                    BackButton(
                      onPressed: () => setState(() {
                        fieldIsTapped = false;
                        FocusScope.of(context).requestFocus(focusNode);
                      }),
                      color: ColourStyles.mainText,
                    ), // [END Search box back/return button]
                  // [START Search box/field]
                  SearchBar(
                    controller: searchBarController,
                    fieldIsTapped: fieldIsTapped,
                    onTap: () => setState(() {
                      fieldIsTapped = true;
                    }),
                    onEditingComplete: () => setState(() {
                      fieldIsTapped = false;
                      FocusScope.of(context).requestFocus(focusNode);
                    }),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => searchBarController.text = ''),
                      icon: Icon(
                        Icons.cancel,
                        size: 15,
                        color: ColourStyles.mainText,
                      ),
                    ),
                  ),
                  // [END Search box/field]
                ],
              ),
            ),
            /* Recipe list */
            Expanded(
              flex: 2,
              child: GestureDetector(
                // onTap: unfocus search bar
                onTap: () {
                  setState(() {
                    fieldIsTapped = false;
                    FocusScope.of(context).requestFocus(focusNode);
                  });
                },
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({Key? key, required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed,
      icon: const Icon(
        Icons.cancel,
        size: 15,
        color: mainTextColour,
      ),
    );
  }
}
