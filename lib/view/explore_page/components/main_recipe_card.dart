import 'package:e_gordon/custom_theme.dart';
import 'package:flutter/material.dart';

class MainRecipeCard extends StatelessWidget {
  const MainRecipeCard({Key? key}) : super(key: key);

  final String label = "Editor's Pick";
  final String title = "Grilled Cheese Sandwich";
  final int rating = 3;
  final String chef = "Musa Rikhotso";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: size.height * 0.3,
        width: size.width * 0.4,
        decoration: CustomTheme.mainRecipeCardDecoration(),
        child: Stack(
          children: [
            // [START Card Label]
            Text(
              label,
              style: TextStyle(
                fontSize: CustomTheme.lightTextTheme.bodySmall?.fontSize,
                color: CustomTheme.white,
              ),
            ),
            // [END Card Label]

            // [START Recipe Title]
            Positioned(
              width: size.width * 0.4,
              child: Text(
                title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: CustomTheme.lightTextTheme.headlineMedium?.fontSize,
                  color: CustomTheme.white,
                ),
              ),
              top: 20,
            ),
            // [END Recipe Title]

            // [START Recipe Rating]
            Positioned(
              width: size.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star_outlined : Icons.star_border,
                    size: size.height * 0.02,
                    color: CustomTheme.white,
                  );
                }),
              ),
              bottom: 25,
              right: 0,
            ),
            // [END Recipe Rating]

            // [START Chef's name]
            Positioned(
              child: Text(
                chef,
                style: TextStyle(
                  fontSize: CustomTheme.lightTextTheme.bodySmall?.fontSize,
                  color: CustomTheme.white,
                ),
              ),
              bottom: 7,
              right: 0,
            )
            // [END Chef's name]
          ],
        ),
      ),
    );
  }
}
