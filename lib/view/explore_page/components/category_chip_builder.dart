import 'package:e_gordon/view/styles.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

class CategoryChipBuilder extends StatefulWidget {
  CategoryChipBuilder({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  void Function(int index)? onSelected;
  int userChoiceIndex = 0;

  @override
  State<CategoryChipBuilder> createState() => _CategoryChipBuilderState();
}

class _CategoryChipBuilderState extends State<CategoryChipBuilder> {
  final List<dynamic> categories = Recipe.categoryList();

  int userChoiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: size.width * 0.03),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: userChoiceIndex == index,
              onSelected: (selected) {
                widget.onSelected!(index);
                userChoiceIndex = index;
                // setState(() => userChoiceIndex = index);
              },
              // [START Chip Styling]
              selectedColor: ColourStyles.primary,
              labelStyle: TextStyle(
                color: userChoiceIndex == index
                    ? ColourStyles.white
                    : ColourStyles.secondaryText,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.all(size.height * 0.015),
              backgroundColor: ColourStyles.lightGray,
              // [END Chip Styling]
            ),
          );
        },
      ),
    );
  }
}
