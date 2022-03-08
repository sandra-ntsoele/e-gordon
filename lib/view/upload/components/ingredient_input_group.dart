import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class IngredientInputGroup extends StatefulWidget {
  const IngredientInputGroup(this.focusNode, {Key? key}) : super(key: key);

  final FocusNode? focusNode;

  @override
  State<IngredientInputGroup> createState() => IngredientInputGroupState();
}

class IngredientInputGroupState extends State<IngredientInputGroup> {
  final List<String> unitsOfMeasurement = [
    "unit(s)",
    "ml",
    "g",
    "L",
    "m",
    "cm",
    "kg"
  ];

  String? dropdownValue = "unit(s)";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.06,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              focusNode: widget.focusNode,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(label: Text("Ingredient")),
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(overflow: TextOverflow.ellipsis),
              ),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Expanded(
            child: DropdownButtonFormField(
              menuMaxHeight: 200,
              value: dropdownValue,
              onChanged: (String? input) {
                setState(() {
                  dropdownValue = input;
                });
              },
              items: unitsOfMeasurement.map<DropdownMenuItem<String>>(
                (String unit) {
                  return DropdownMenuItem(
                    alignment: Alignment.bottomCenter,
                    value: unit,
                    child: Text(
                      unit,
                      style: const TextStyle(
                        color: mainTextColour,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
