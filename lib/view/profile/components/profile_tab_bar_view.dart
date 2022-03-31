import 'package:flutter/material.dart';

class ProfileTabBarView extends StatelessWidget {
  const ProfileTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: TabBarView(
          children: [],
        ),
      ),
    );
  }
}
