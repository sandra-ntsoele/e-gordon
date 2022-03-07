import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    required this.stateLabel,
  }) : super(key: key);

  final String stateLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty-state-greyscale.png",
            width: 125,
          ),
          Paragraph(
            text: stateLabel,
            paragraphType: 2,
          ),
        ],
      ),
    );
  }
}
