import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class ProfileStatistic extends StatelessWidget {
  final String label;
  final String figure;

  const ProfileStatistic({
    Key? key,
    required this.figure,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(text: figure, headingType: 3),
        Paragraph(text: label, paragraphType: 2),
      ],
    );
  }
}
