import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class IngredientsListView extends StatefulWidget {
  const IngredientsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<IngredientsListView> createState() => _IngredientsListViewState();
}

class _IngredientsListViewState extends State<IngredientsListView> {
  List additionalInputFields = [];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Scrollbar(
            child: additionalInputFields.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/empty-state-greyscale.png",
                          width: 125,
                        ),
                        const Paragraph(
                          text: "Start adding ingredients",
                          paragraphType: 2,
                        ),
                      ],
                    ),
                  )
                : Scrollbar(
                    isAlwaysShown: true,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: additionalInputFields.length,
                      itemBuilder: (context, int index) {
                        return additionalInputFields[index];
                      },
                    ),
                  ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        const Divider(
          thickness: 0,
          color: Colors.transparent,
        ),
        SizedBox(
          width: size.width,
          child: addIngredientButton(size),
        ),
      ],
    );
  }

  Padding addIngredientButton(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            additionalInputFields.add(_inputField(size));
          });
        },
        icon: const Icon(
          Icons.add,
          size: 25,
          color: mainTextColour,
        ),
        label: const Text(
          "INGREDIENT",
          style: TextStyle(
            color: mainTextColour,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(15),
          side: const BorderSide(
            color: outlineColour,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _inputField(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          const Icon(
            Icons.drag_indicator_outlined,
            color: outlineColour,
          ),
          SizedBox(width: size.width * 0.015),
          Expanded(
            child: RoundedTextField(
              label: "Enter ingredient",
            ),
          ),
        ],
      ),
    );
  }
}
