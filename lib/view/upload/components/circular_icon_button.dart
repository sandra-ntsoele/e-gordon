import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    required this.bgColour,
    required this.onPressed,
    required this.iconColour,
    required this.icon,
  }) : super(key: key);

  final Color bgColour;
  final Function() onPressed;
  final Color iconColour;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.height * 0.04,
      decoration: BoxDecoration(
        color: bgColour,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: iconColour,
        iconSize: size.height * 0.02,
      ),
    );
  }
}
