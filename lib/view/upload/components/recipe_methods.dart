import 'package:e_gordon/controller/upload_controller.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/custom_text_button.dart';
import 'package:e_gordon/view/upload/components/empty_state.dart';
import 'package:e_gordon/view/upload/components/multi_line_text_field.dart';
import 'package:e_gordon/view/upload/components/prep_method_card.dart';
import 'package:e_gordon/view/upload/components/recipe_instructions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'circular_icon_button.dart';

class RecipeMethods extends StatefulWidget {
  const RecipeMethods({Key? key}) : super(key: key);

  @override
  State<RecipeMethods> createState() => _RecipeMethodsState();
}

class _RecipeMethodsState extends State<RecipeMethods> {
  final List listOfSteps = [];
  final List prepMethodCards = [];
  final ScrollController scrollController = ScrollController();
  final UploadController uploadController = UploadController();
  int instructionCount = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(text: "Steps", headingType: 2, overflow: false),
        SizedBox(height: size.height * 0.02),
        // Input Group
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                height: size.height * 0.3,
                child: prepMethodCards.isEmpty
                    ? const EmptyState(stateLabel: "Start adding instructions")
                    : Scrollbar(
                        isAlwaysShown: true,
                        controller: scrollController,
                        child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: prepMethodCards.length,
                          itemBuilder: (context, index) {
                            return prepMethodCards[index];
                          },
                        ),
                      ),
              ),
            ),
            SizedBox(width: size.height * 0.02),
            /* Side buttons to add/remove a step */
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /* Button ADDS new input field */
                CircularIconButton(
                  icon: const Icon(Icons.add),
                  bgColour: mainTextColour,
                  onPressed: () {
                    instructionCount++;
                    uploadController.showInstructionDialog(
                        context, instructionCount);
                    // methodCounter++;
                    // setState(() {
                    //   // listOfSteps.add(const MethodInputField());
                    //   prepMethodCards.add(PreparationMethodCard(methodCounter));
                    // });
                  },
                  iconColour: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                /* Button REMOVES input field */
                CircularIconButton(
                  icon: const Icon(Icons.remove),
                  bgColour: outlineColour,
                  onPressed: () {
                    instructionCount--;
                    setState(() {
                      // listOfSteps.removeLast();
                      prepMethodCards.isNotEmpty
                          ? prepMethodCards.removeLast()
                          : null;
                    });
                  },
                  iconColour: Colors.white,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class MethodInputField extends StatelessWidget {
  const MethodInputField({Key? key}) : super(key: key);

  final int counter = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      /* Input TextField + add image button */
      children: [
        SizedBox(height: size.height * 0.01),
        MultiLineTextField(
          label: "Describe step $counter of preparation",
        ),
        // Add image button
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
        )
      ],
    );
  }
}
