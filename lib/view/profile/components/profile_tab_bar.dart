import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: size.height * 0.05,
          thickness: 3,
          color: outlineColour,
        ),
        const TabBar(
          tabs: [
            Tab(text: "Recipes"),
            Tab(text: "Liked"),
          ],
          labelColor: mainTextColour,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: primaryColour,
        ),
      ],
    );
  }
}
