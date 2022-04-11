import 'package:e_gordon/view/components/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return const Scaffold(
      appBar: MainCustomAppBar(title: "Profile"),
      body: Center(
        child: Text("Welcome to your profile"),
      ),
    );
  }
}
