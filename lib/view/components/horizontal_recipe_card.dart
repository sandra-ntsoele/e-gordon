import 'package:e_gordon/custom_theme.dart';
import 'package:flutter/material.dart';

class HorizontalRecipeCard extends StatelessWidget {
  const HorizontalRecipeCard({
    Key? key,
    required this.recipe,
    required this.category,
    required this.duration,
    required this.imageUrl,
    required this.rating,
  }) : super(key: key);

  final String recipe;
  final String category;
  final double duration;
  final String imageUrl;
  final int rating;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 5,
      color: CustomTheme.mainTextPrussianBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: size.height * 0.13,
        width: size.width * 0.4,
        decoration: CustomTheme.horizontalCardDecoration(imageUrl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe,
              style: TextStyle(
                fontSize: CustomTheme.lightTextTheme.headlineMedium?.fontSize,
                color: CustomTheme.white,
              ),
            ),
            Expanded(
              child: Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star_outlined : Icons.star_border,
                    size: size.height * 0.015,
                    color: CustomTheme.white,
                  );
                }),
              ),
            ),
            Text(
              "${duration.toInt().toString()} min | Serves: 4",
              style: TextStyle(
                fontSize: CustomTheme.lightTextTheme.bodySmall?.fontSize,
                color: CustomTheme.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
