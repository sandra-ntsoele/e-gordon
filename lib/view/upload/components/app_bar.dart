import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const CustomAppBar({Key? key, required this.appBar, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      foregroundColor: const Color.fromRGBO(44, 44, 44, 1),
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
            child: const Text(
              "Cancel",
              style: TextStyle(
                height: 3,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      leadingWidth: size.width * 0.3,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Text(
            "${index}/2",
            style: const TextStyle(
              height: 3,
              fontWeight: FontWeight.bold,
              color: mainTextColour,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
