import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/recipe_steps.dart';
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
          /* Add Ingredients */
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: IngredientsListView(),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey.shade100,
            height: size.height * 0.02,
          ),
          /* Recipe Steps */
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: RecipeSteps(),
          ),
        ],
      ),
    );
  }
}
