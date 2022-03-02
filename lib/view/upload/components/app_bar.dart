import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.appBar,
    required this.index,
  }) : super(key: key);

  final AppBar appBar;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      foregroundColor: mainTextColour,
      backgroundColor: Colors.white,
      leading: cancelButton(context),
      leadingWidth: size.width * 0.2,
      actions: [stepTracker(index)],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  Widget cancelButton(context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          "Cancel",
          style: TextStyle(
            height: 3,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget stepTracker(index) {
    int currentStep = index + 1;

    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Text(
        "$currentStep/2",
        style: const TextStyle(
          height: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
