import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.suffixIcon,
    required this.fieldIsTapped,
    required this.onTap,
    required this.onEditingComplete,
  }) : super(key: key);

  final Widget suffixIcon;
  final TextEditingController controller;
  final bool fieldIsTapped;
  final void Function() onTap;
  final void Function() onEditingComplete;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 6,
      child: SizedBox(
        height: size.height * 0.08,
        child: TextFormField(
          controller: widget.controller,
          // [START Event handling]
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          // [END Event handling]
          // [START Input field styling]
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            labelText: "Search",
            labelStyle: TextStyle(fontSize: 12, color: ColourStyles.outline),
            contentPadding: const EdgeInsets.only(top: 0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: ColourStyles.primary, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: ColourStyles.lightGray, width: 5),
            ),
            filled: true,
            fillColor: ColourStyles.lightGray,
            prefixIcon: const Icon(Icons.search_outlined, size: 15),
            suffixIcon: widget.fieldIsTapped ? widget.suffixIcon : null,
          ),
          // [END Input field styling]
        ),
      ),
    );
  }
}
