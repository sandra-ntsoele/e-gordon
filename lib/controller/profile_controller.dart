import 'package:e_gordon/view/upload/recipe.dart';
import 'package:e_gordon/view/upload/upload_screen.dart';
import 'package:e_gordon/view/upload/upload_step_one.dart';
import 'package:e_gordon/view/upload/upload_step_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileController {
  void viewProfile() {}

  void getUploadScreen(context) {
    Recipe recipe = Recipe();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadScreen(),
      ),
    );
  }
}
