import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/home_page/components/category_chip_builder.dart';
import 'package:e_gordon/view/home_page/home_page_controller.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'components/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode focusNode = FocusNode();
  bool fieldIsTapped = false;
  final searchBarController = TextEditingController();
  final HomePageController homePageController = HomePageController();
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                        ), // [END Search box back/return button]

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
                            // print(choice);
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
      ),
    );
  }
}
