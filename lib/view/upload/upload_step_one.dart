import 'package:e_gordon/controller/upload_controller.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

import 'components/image_picker.dart';
import 'components/multi_line_text_field.dart';
import 'components/rounded_text_field.dart';

class UploadStepOne extends StatefulWidget {
  const UploadStepOne({Key? key}) : super(key: key);

  @override
  State<UploadStepOne> createState() => _UploadStepOneState();
}

class _UploadStepOneState extends State<UploadStepOne> {
  final formKey = GlobalKey<FormState>();
  UploadController uploadController = UploadController();

  TextEditingController nameTxtController = TextEditingController();
  TextEditingController descriptionTxtController = TextEditingController();

  @override
  void dispose() {
    nameTxtController.dispose();
    descriptionTxtController.dispose();

    super.dispose();
  }

  double _currentSliderValue = 10;
  Recipe recipe = Recipe();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            ImagePicker(size: size),
            SizedBox(height: size.height * 0.03),
            Heading(text: "Food Name", headingType: 3, overflow: false),
            SizedBox(height: size.height * 0.03),
            RoundedTextField(
              label: "Enter food name",
              fieldController: nameTxtController,
              validatorFunc: (input) => uploadController.validateName(input),
            ),
            SizedBox(height: size.height * 0.03),
            Heading(text: "Description", headingType: 3, overflow: false),
            SizedBox(height: size.height * 0.03),
            MultiLineTextField(
              label: "Tell a little about your food.",
              fieldController: descriptionTxtController,
              validatorFunction: (input) =>
                  uploadController.validateDescription(input),
            ),
            SizedBox(height: size.height * 0.03),
            RichText(
              text: const TextSpan(
                text: "Duration ",
                style: TextStyle(
                  color: mainTextColour,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "(in minutes)",
                    style: TextStyle(
                      color: outlineColour,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Slider(
              value: _currentSliderValue,
              min: 10,
              max: 60,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              thumbColor: primaryColour,
              activeColor: primaryColour,
              inactiveColor: outlineColour,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              onChangeEnd: (value) {
                recipe.duration = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
