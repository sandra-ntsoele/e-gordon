import 'package:e_gordon/view/upload/upload_step_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileController {
  void viewProfile() {}

  void getUploadScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UploadStepOne(),
      ),
    );
  }
}
