import 'package:e_gordon/model/get_user_recipes.dart';
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
          children: [
            GetUserRecipes("2PvpeqWzcKyzUj0mRrJa"),
            GetUserRecipes("2PvpeqWzcKyzUj0mRrJa"),
          ],
        ),
      ),
    );
  }
}
