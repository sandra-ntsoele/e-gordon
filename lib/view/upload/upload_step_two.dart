import 'package:flutter/material.dart';

class UploadStepTwo extends StatefulWidget {
  const UploadStepTwo({Key? key}) : super(key: key);

  @override
  _UploadStepTwoState createState() => _UploadStepTwoState();
}

class _UploadStepTwoState extends State<UploadStepTwo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IngredientsSection(),
                RCPSteps(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RCPSteps extends StatelessWidget {
  const RCPSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
