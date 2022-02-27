import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/app_bar.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/add_ingredient_section.dart';
import 'components/recipe_steps.dart';

class UploadStepTwo extends StatefulWidget {
  final Recipe recipe;

  UploadStepTwo({
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
    print(widget.recipe.name);

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        index: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: IngredientsSection(),
                ),
                Divider(
                  height: size.height * 0.1,
                  color: outlineColour,
                  thickness: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: RecipeSteps(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
