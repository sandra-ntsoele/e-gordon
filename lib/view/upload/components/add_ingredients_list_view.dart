import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/empty_state.dart';
import 'package:e_gordon/view/upload/components/ingredient_input_group.dart';
import 'package:flutter/material.dart';

import 'circular_icon_button.dart';

class IngredientsListView extends StatefulWidget {
  const IngredientsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<IngredientsListView> createState() => _IngredientsListViewState();
}

class _IngredientsListViewState extends State<IngredientsListView> {
  List inputGroupList = [];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(
          text: "Ingredients",
          headingType: 3,
          overflow: false,
        ),
        SizedBox(
          height: size.height * 0.25,
          child: inputGroupList.isEmpty
              ? const EmptyState(stateLabel: "Start adding ingredients")
              : Scrollbar(
                  isAlwaysShown: true,
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: inputGroupList.length,
                    itemBuilder: (context, index) {
                      scrollController.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                      return inputGroupList[index];
                    },
                  ),
                ),
        ),
        SizedBox(width: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /* Button ADDS new input group */
            CircularIconButton(
              icon: const Icon(Icons.add),
              bgColour: mainTextColour,
              onPressed: () {
                setState(() {
                  var inputGroup = IngredientInputGroup(FocusNode());

                  inputGroupList.add(inputGroup);
                  inputGroup.focusNode?.requestFocus();
                });
              },
              iconColour: Colors.white,
            ),
            SizedBox(width: size.height * 0.015),
            /* Button REMOVES input group */
            CircularIconButton(
              icon: const Icon(Icons.remove),
              bgColour: outlineColour,
              onPressed: () {
                setState(() {
                  inputGroupList.isNotEmpty
                      ? inputGroupList.removeLast()
                      : null;
                });
              },
              iconColour: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}
