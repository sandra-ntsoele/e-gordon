import 'package:e_gordon/view/components/rounded_button.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
      appBar: AppBar(
        foregroundColor: mainTextColour,
        backgroundColor: Colors.white,
        leading: const UploadCancelButton(),
        leadingWidth: size.width * 0.2,
        actions: [UploadStepsTracker(index: index)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                child: Row(children: [
                  Expanded(child: _navigationButtons[i]),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                ]),
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

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.bgColour,
    required this.fontColour,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Color bgColour;
  final Function() onPressed;
  final String label;
  final Color fontColour;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fontColour,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: bgColour,
        padding: const EdgeInsets.all(20),
        side: const BorderSide(
          color: Colors.transparent,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class UploadStepsTracker extends StatelessWidget {
  const UploadStepsTracker({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Text(
        "${index}/2",
        style: const TextStyle(
          height: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class UploadCancelButton extends StatelessWidget {
  const UploadCancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          "Cancel",
          style: TextStyle(
            height: 3,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
