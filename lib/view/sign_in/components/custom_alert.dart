import 'package:flutter/material.dart';
import 'package:e_gordon/view/constants.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/verify-email-trans.png",
            width: size.width * 0.13,
            fit: BoxFit.contain,
          ),
          SizedBox(width: size.width * 0.03),
          Flexible(
            child: Text(
              message,
              softWrap: true,
              style: const TextStyle(
                fontSize: smallText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
