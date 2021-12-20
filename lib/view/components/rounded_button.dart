import 'package:flutter/material.dart';
import 'package:e_gordon/view/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.btnColour,
    this.btnIcon,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  Color? btnColour;
  IconData? btnIcon;

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
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
        primary: btnColour != null ? btnColour : primaryColour,
        fixedSize: const Size.fromHeight(56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
