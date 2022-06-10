import 'package:e_gordon/custom_theme.dart';
import 'package:e_gordon/view/explore_page/components/main_recipe_card.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended",
          style: CustomTheme.lightTextTheme.headlineMedium,
        ),
        SizedBox(height: size.height * 0.015),
        SizedBox(
          height: size.height * 0.25,
          child: ListView.separated(
            itemBuilder: (context, index) => const MainRecipeCard(),
            separatorBuilder: (context, index) => SizedBox(
              width: size.width * 0.03,
            ),
            itemCount: 5, //TODO use dynamic value
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
