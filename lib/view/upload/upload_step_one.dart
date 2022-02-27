import 'package:e_gordon/controller/upload_controller.dart';
import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/recipe.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(text: "Food Name", headingType: 3, overflow: false),
                  SizedBox(height: size.height * 0.03),
                  RoundedTextField(
                    label: "Enter food name",
                    fieldController: nameTxtController,
                    validatorFunc: (input) =>
                        uploadController.validateName(input),
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
                  Heading(text: "Duration", headingType: 3, overflow: false),
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
                  SizedBox(height: size.height * 0.03),
                  RoundedButton(
                      text: "Next",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          recipe.name = nameTxtController.text;
                          recipe.description = descriptionTxtController.text;
                          recipe.duration == null
                              ? recipe.duration = _currentSliderValue
                              : null;

                          uploadController.goToStepTwo(context, recipe);
                        } else {
                          return null;
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
