import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.category,
    required this.duration,
  }) : super(key: key);

  final String recipe;
  final String category;
  final double duration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                "assets/images/pancake.jpeg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Heading(text: recipe, headingType: 3, overflow: true),
            SizedBox(height: size.height * 0.01),
            Row(
              children: [
                Text(
                  category,
                  style: const TextStyle(fontSize: 10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    size: 5,
                  ),
                ),
                Text(
                  "$duration mins",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
