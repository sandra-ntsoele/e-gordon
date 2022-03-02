import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/upload/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'components/custom_text_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), index: index),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _uploadScreenStack(),
          _navigationButtons(size),
        ],
      ),
    );
  }

  Widget _navigationButtons(size) {
    final List<Widget> _navigationButtons = [
      CustomTextButton(
        bgColour: primaryColour,
        onPressed: () {
          setState(() {
            index = 1;
          });
        },
        label: "Next",
        fontColour: Colors.white,
      ),
      CustomTextButton(
        bgColour: Colors.grey.shade100,
        onPressed: () {
          setState(() {
            index = 0;
          });
        },
        label: "Back",
        fontColour: mainTextColour,
      )
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Row(
        children: [
          if (index == 0)
            Expanded(child: _navigationButtons[0])
          else
            for (var i = 0; i < _navigationButtons.length; i++)
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _navigationButtons[i]),
                    SizedBox(width: size.width * 0.03),
                  ],
                ),
              )
        ],
      ),
    );
  }

  Widget _uploadScreenStack() {
    return IndexedStack(
      index: index,
      children: [
        Center(
          child: Text("Step 1"),
        ),
        Center(
          child: Text("Step 2"),
        )
      ],
    );
  }
}
