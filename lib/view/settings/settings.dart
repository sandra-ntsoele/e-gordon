import 'package:e_gordon/view/components/main_app_bar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainCustomAppBar(title: "Settings"),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
