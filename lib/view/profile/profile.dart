import 'package:e_gordon/model/get_user_recipes.dart';
import 'package:e_gordon/view/profile/components/profile_header.dart';
import 'package:e_gordon/view/profile/components/profile_navigation_bar.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'components/profile_tab_bar.dart';
import 'components/profile_tab_bar_view.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const ProfileNavigationBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home_filled),
        backgroundColor: primaryColour,
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [const SliverToBoxAdapter(child: ProfileHeader())];
          },
          body: Column(
            children: [
              ProfileTabBar(size: size),
              ProfileTabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}
