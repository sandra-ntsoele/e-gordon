import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'components/add_ingredients_list_view.dart';

class UploadStepTwo extends StatefulWidget {
  final Recipe recipe;

  const UploadStepTwo({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _UploadStepTwoState createState() => _UploadStepTwoState();
}

class _UploadStepTwoState extends State<UploadStepTwo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),
                Heading(
                  text: "Ingredients",
                  headingType: 2,
                  overflow: false,
                ),
                SizedBox(height: size.height * 0.015),
                const IngredientsListView(),
              ],
            ),
          ),
          Divider(thickness: 5, color: Colors.grey.shade100, height: 50),
        ],
      ),
    );
  }
}
