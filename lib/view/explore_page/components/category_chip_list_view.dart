import 'package:e_gordon/custom_theme.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

class CategoryChipListView extends StatefulWidget {
  const CategoryChipListView({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  final void Function(int index)? onSelected;
  final int userChoiceIndex = 0;

  @override
  State<CategoryChipListView> createState() => _CategoryChipListViewState();
}

class _CategoryChipListViewState extends State<CategoryChipListView> {
  final List<dynamic> categoryList = Recipe.categoryList();

  int userChoice = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.085,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, categoryChipIndex) {
          return Container(
            margin: EdgeInsets.only(right: size.width * 0.015),
            child: ChoiceChip(
              label: Text(
                categoryList[categoryChipIndex],
                style: TextStyle(
                  fontSize: CustomTheme.lightTextTheme.bodySmall?.fontSize,
                ),
              ),
              selected: userChoice == categoryChipIndex,
              onSelected: (bool selected) {
                widget.onSelected!(categoryChipIndex);
                userChoice = categoryChipIndex;
                // setState(() => userChoiceIndex = index);
              },
              // [START Chip Styling]
              selectedColor: ColourStyles.primary,
              labelStyle: TextStyle(
                color: userChoice == categoryChipIndex
                    ? ColourStyles.white
                    : ColourStyles.secondaryText,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.all(size.height * 0.015),
              backgroundColor: CustomTheme.lightGray,
              // [END Chip Styling]
            ),
          );
        },
      ),
    );
  }
}
