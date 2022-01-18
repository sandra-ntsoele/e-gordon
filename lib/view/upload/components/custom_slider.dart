import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              index += 1;
              return Paragraph(text: "${index * 10} ", paragraphType: 3);
            }),
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 10,
          max: 60,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          thumbColor: primaryColour,
          activeColor: primaryColour,
          inactiveColor: outlineColour,
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
