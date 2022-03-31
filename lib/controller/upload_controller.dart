import 'package:e_gordon/view/upload/components/recipe_instructions_dialog.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:e_gordon/view/upload/upload_step_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadController {
  Future showInstructionDialog(BuildContext context, int count) {
    return showGeneralDialog(
      context: context,
      barrierLabel: "close",
      barrierDismissible: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return SingleChildScrollView(
          child: RecipeInstructionsDialog(),
        );
      },
    );
  }

  void goToStepTwo(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => UploadStepTwo(),
      ),
    );
  }

  String? validateDescription(String? input) {
    if (input == null || input.isEmpty) {
      return "Please provide a description";
    }
    return null;
  }

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return "Please provide a name";
    }
    return null;
  }
}
