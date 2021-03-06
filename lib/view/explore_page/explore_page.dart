import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/explore_page/components/explore_app_bar.dart';
import 'package:e_gordon/view/explore_page/components/explore_header.dart';
import 'package:e_gordon/view/explore_page/components/explore_page_body.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  static bool searchFieldIsFocused = false;
  static ExplorePageController explorePageController = ExplorePageController();

  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  FocusNode focusNode = FocusNode();
  int recipeFilter = 0;
  final User? currentUser = AuthService().user;

  selectedCategory(int userChoice) {
    setState(() => recipeFilter = userChoice);
  }

  changeFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (currentUser == null) {
      Navigator.of(context).pushNamed("/");
    }

    return Scaffold(
      appBar: const ExploreAppBar(title: "Explore"),
      backgroundColor: ColourStyles.white,
      body: Column(
        children: [
          ExploreHeader(
            selectedCategory: selectedCategory,
          ),
          SizedBox(height: size.height * 0.03),
          ExplorePageBody(
            filter: recipeFilter,
            onTap: changeFocus,
          ),
        ],
      ),
    );
  }
}
