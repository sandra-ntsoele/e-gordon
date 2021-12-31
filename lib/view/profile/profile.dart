import 'package:e_gordon/view/profile/components/profile_header.dart';
import 'package:e_gordon/view/profile/components/profile_navigation_bar.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'components/recipe_card.dart';

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
              Expanded(
                child: SizedBox(
                  child: TabBarView(
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        children: const [
                          RecipeCard(
                            recipe: "Pancake",
                            category: "Food",
                            duration: 60,
                          ),
                          RecipeCard(
                            recipe: "Salad",
                            category: "Food",
                            duration: 60,
                          ),
                          RecipeCard(
                            recipe: "Pancake",
                            category: "Food",
                            duration: 60,
                          ),
                        ],
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        children: const [
                          RecipeCard(
                            recipe: "Pancake",
                            category: "Food",
                            duration: 60,
                          ),
                          RecipeCard(
                            recipe: "Salad",
                            category: "Food",
                            duration: 60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
