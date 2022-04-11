import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class ClearTextButton extends StatefulWidget {
  final TextEditingController searchBarController;

  const ClearTextButton({Key? key, required this.searchBarController})
      : super(key: key);

  @override
  State<ClearTextButton> createState() => _ClearTextButtonState();
}

class _ClearTextButtonState extends State<ClearTextButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() => widget.searchBarController.text = ''),
      icon: Icon(
        Icons.cancel,
        size: 15,
        color: ColourStyles.mainText,
      ),
    );
  }
}
