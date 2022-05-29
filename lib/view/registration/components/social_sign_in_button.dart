import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class SocialSignInBtn extends StatelessWidget {
  final Function onPressed;
  final String providerLogo;
  final String btnLabel;

  const SocialSignInBtn({
    Key? key,
    required this.onPressed,
    required this.btnLabel,
    required this.providerLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 0,
      ),
      child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/$providerLogo",
                scale: 50,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                btnLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // [START Btn decoration]
        style: OutlinedButton.styleFrom(
          primary: ColourStyles.mainText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        // [END Btn decoration]
        onPressed: () async => onPressed,
      ),
      // [END Reg with Google Button]
    );
  }
}
