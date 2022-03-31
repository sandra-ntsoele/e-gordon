import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/multi_line_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class RecipeInstructionsDialog extends StatelessWidget {
  RecipeInstructionsDialog({Key? key}) : super(key: key);

  int instructionCount = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController instructionTitle = TextEditingController();
  final TextEditingController instructionDescription = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.8,
        color: const Color.fromRGBO(255, 255, 255, 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(
              text: "Step ${instructionCount}",
              headingType: 2,
              overflow: false,
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    // autofocus: true,
                    // focusNode: _focusNode,
                    decoration: const InputDecoration(
                        labelText: "Instruction. (E.g. Mix dry ingredients)",
                        labelStyle: TextStyle(
                          fontSize: 13,
                          color: secondaryTextColour,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: outlineColour,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColour, width: 2),
                        )),
                  ),
                  SizedBox(height: size.height * 0.03),
                  MultiLineTextField(
                    label: "Description",
                    height: size.height * 0.3,
                  ),
                  SizedBox(height: size.height * 0.03),
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
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          instructionCount = 0;
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "CLOSE",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: mainTextColour,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: mainTextColour,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
