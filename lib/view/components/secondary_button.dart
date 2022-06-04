import 'package:flutter/material.dart';
import 'package:e_gordon/view/constants.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData? btnIcon;
  final bool isGhostButton;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.btnIcon,
    required this.isGhostButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (btnIcon != null) ...[
              Icon(btnIcon),
              SizedBox(
                width: size.width * 0.03,
              ),
            ],
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        // onPrimary: HeadingColour,
        backgroundColor: Colors.white,
        primary: outlineColour,
        fixedSize: const Size.fromHeight(56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          side: BorderSide(
            color: outlineColour,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }
}
