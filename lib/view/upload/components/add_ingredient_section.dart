import 'package:e_gordon/view/upload/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(text: "Ingredients", headingType: 2, overflow: false),
        SizedBox(height: size.height * 0.03),
        Row(
          children: [
            const Icon(
              Icons.menu_rounded,
              color: outlineColour,
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(child: RoundedTextField(label: "Enter ingredient")),
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Row(
          children: [
            const Icon(
              Icons.menu_rounded,
              color: outlineColour,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Expanded(child: RoundedTextField(label: "Enter ingredient")),
          ],
        ),
        SizedBox(height: size.height * 0.05),
        OutlinedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: outlineColour,
                    ),
                    SizedBox(width: size.width * 0.03),
                    const Text(
                      "Ingredient",
                      style: TextStyle(
                        color: mainTextColour,
                        fontWeight: FontWeight.bold,
                        fontSize: paragraphTwo,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
      ],
    );
  }
}
