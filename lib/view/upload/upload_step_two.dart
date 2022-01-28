import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/add_ingredient_section.dart';

class UploadStepTwo extends StatefulWidget {
  const UploadStepTwo({Key? key}) : super(key: key);

  @override
  _UploadStepTwoState createState() => _UploadStepTwoState();
}

class _UploadStepTwoState extends State<UploadStepTwo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IngredientsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
