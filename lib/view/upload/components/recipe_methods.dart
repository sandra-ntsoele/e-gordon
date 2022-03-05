import 'dart:io';

import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/multi_line_text_field.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'circular_icon_button.dart';

class RecipeMethods extends StatefulWidget {
  RecipeMethods({Key? key}) : super(key: key);

  @override
  State<RecipeMethods> createState() => _RecipeMethodsState();
}

class _RecipeMethodsState extends State<RecipeMethods> {
  final List listOfSteps = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(text: "Steps", headingType: 2, overflow: false),
        SizedBox(height: size.height * 0.02),
        // Input Group
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfSteps.length,
                itemBuilder: (context, index) {
                  return listOfSteps[index];
                },
              ),
            ),
            SizedBox(width: size.height * 0.02),
            /* Side buttons to add/remove a step */
            Column(
              children: [
                CircularIconButton(
                  icon: const Icon(Icons.add),
                  bgColour: mainTextColour,
                  onPressed: () {},
                  iconColour: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CircularIconButton(
                  icon: const Icon(Icons.remove),
                  bgColour: outlineColour,
                  onPressed: () {},
                  iconColour: Colors.white,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class MethodInputField extends StatelessWidget {
  const MethodInputField({Key? key}) : super(key: key);

  final int counter = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        /* Input TextField + add image button */
        children: [
          MultiLineTextField(
            label: "Describe step $counter of preparation",
          ),
          // Add image button
          SizedBox(
            width: size.width,
            child: OutlinedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
              },
              child: const Icon(
                Icons.camera_alt_rounded,
                color: mainTextColour,
              ),
            ),
          )
        ],
      ),
    );
  }
}
