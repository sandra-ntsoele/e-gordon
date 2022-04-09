import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/explore_page/explore_app_bar.dart';
import 'package:e_gordon/view/explore_page/explore_page_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

import 'components/category_chip_builder.dart';
import 'components/search_bar.dart';

class ExplorePage extends StatefulWidget {
  // final String title
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  FocusNode focusNode = FocusNode();

  bool fieldIsTapped = false;

  final searchBarController = TextEditingController();

  final ExplorePageController homePageController = ExplorePageController();

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ExploreAppBar(title: "Explore"),
      body: Column(
        children: [
          /* Search bar and categories container */
          Container(
            // [START Container Styling]
            padding: LayoutStyles.completePadding,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: ColourStyles.lightGray,
                  width: size.width * 0.01,
                ),
              ),
            ),
            // [END Container Styling]
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (fieldIsTapped)
                      // [START Search box back/return button]
                      BackButton(
                        onPressed: () => setState(() {
                          fieldIsTapped = false;

                          FocusScope.of(context).requestFocus(focusNode);
                        }),
                        color: ColourStyles.mainText,
                      ),
                    // [END Search box back/return button]
                    // [START Search box/field]
                    SearchBar(
                      controller: searchBarController,
                      fieldIsTapped: fieldIsTapped,
                      onTap: () => setState(() {
                        fieldIsTapped = true;
                      }),
                      onEditingComplete: () => setState(() {
                        fieldIsTapped = false;

                        FocusScope.of(context).requestFocus(focusNode);
                      }),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => searchBarController.text = ''),
                        icon: Icon(
                          Icons.cancel,
                          size: 15,
                          color: ColourStyles.mainText,
                        ),
                      ),
                    ),
                    // [END Search box/field]
                  ],
                ),
                // [START Category Chips]
                Column(
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
                          homePageController.selectedCategoryIndex = choice;
                        });
                      },
                    ),
                  ],
                ),
                // [END Category Chips]
              ],
            ),
          ),
          // [END Header]

          SizedBox(height: size.height * 0.03),

          // [START Recipe list]
          Expanded(
            flex: 2,
            child: GestureDetector(
              // onTap: unfocus search bar
              onTap: () {
                setState(() {
                  fieldIsTapped = false;
                  FocusScope.of(context).requestFocus(focusNode);
                });
              },
              child: homePageController.recipeCardGrid(selectedCategory),
            ),
          )
        ],
      ),
    );
  }
}
