import 'package:e_gordon/view/explore_page/components/recipe_cards_grid_view.dart';
import 'package:flutter/material.dart';

class ExplorePageBody extends StatefulWidget {
  final dynamic onTap;
  final int filter;

  const ExplorePageBody({
    Key? key,
    required this.onTap,
    required this.filter,
  }) : super(key: key);

  @override
  State<ExplorePageBody> createState() => _ExplorePageBodyState();
}

class _ExplorePageBodyState extends State<ExplorePageBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        // onTap: unfocus search bar
        onTap: () => widget.onTap(),
        child: RecipeCardsGridView(
          filter: widget.filter,
        ),
      ),
    );
  }
}
