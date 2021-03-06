import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const ScreenHeader({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Heading(
          text: title,
          headingType: 1,
          overflow: false,
        ),
        Paragraph(
          text: subtitle,
          paragraphType: 2,
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}
