import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.category,
    required this.duration,
    required this.imageUrl,
  }) : super(key: key);

  final String recipe;
  final String category;
  final double duration;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          // color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: size.height * 0.25,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: mainTextColour,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        category,
                        style: const TextStyle(fontSize: 8),
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
                        style: const TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
