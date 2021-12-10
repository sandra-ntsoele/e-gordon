import 'package:flutter/material.dart';
import 'package:e_gordon/constants.dart';

class LongButton extends StatelessWidget {
  const LongButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
        primary: primaryColour,
        fixedSize: Size.fromHeight(56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
