import 'package:e_gordon/view/components/main_app_bar.dart';
import 'package:flutter/material.dart';

class ToBuy extends StatelessWidget {
  const ToBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainCustomAppBar(title: "To-Buy"),
      body: Center(
        child: Text("To-Buy"),
      ),
    );
  }
}
