import 'package:e_gordon/view/upload/upload_step_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadController {
  void goToStepTwo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => const UploadStepTwo(),
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
