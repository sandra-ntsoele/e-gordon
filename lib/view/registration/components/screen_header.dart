import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Heading(
          text: "Welcome!",
          headingType: 1,
          overflow: false,
        ),
        const Paragraph(
          text: "Please enter account details",
          paragraphType: 2,
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}
