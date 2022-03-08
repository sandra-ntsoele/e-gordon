import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreparationMethodCard extends StatelessWidget {
  PreparationMethodCard(this.counter, {Key? key}) : super(key: key);

  int counter;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: outlineColour, width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and typesetting industry.",
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.04,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: outlineColour, width: 1.5),
            ),
            child: Text(
              "$counter",
              style: const TextStyle(color: mainTextColour),
            ),
          ),
        )
      ],
    );
  }
}
