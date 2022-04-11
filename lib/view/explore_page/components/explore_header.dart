import 'package:e_gordon/view/explore_page/components/category_chip_container.dart';
import 'package:e_gordon/view/explore_page/components/search_bar_container.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class ExploreHeader extends StatefulWidget {
  final dynamic selectedCategory;

  const ExploreHeader({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  State<ExploreHeader> createState() => _ExploreHeaderState();
}

class _ExploreHeaderState extends State<ExploreHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BoxDecoration headerDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: ColourStyles.lightGray,
          width: size.width * 0.01,
        ),
      ),
    );

    return Container(
      padding: LayoutStyles.completePadding,
      decoration: headerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarContainer(),
          CategoryChipContainer(
            selectedCategory: widget.selectedCategory,
          ),
        ],
      ),
    );
  }
}
