import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/explore_page/components/category_chip_builder.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:flutter/material.dart';

class CategoryChipContainer extends StatefulWidget {
  const CategoryChipContainer({Key? key}) : super(key: key);

  @override
  State<CategoryChipContainer> createState() => _CategoryChipContainerState();
}

class _CategoryChipContainerState extends State<CategoryChipContainer> {
  final ExplorePageController explorePageController = ExplorePageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.01),
        Heading(
          text: "Category",
          headingType: 3,
          overflow: false,
        ),
        SizedBox(height: size.height * 0.01),
        CategoryChipBuilder(
          onSelected: (choice) {
            setState(() {
              explorePageController.selectedCategoryIndex = choice;
            });
          },
        ),
      ],
    );
  }
}
