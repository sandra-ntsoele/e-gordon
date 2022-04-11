import 'package:e_gordon/view/explore_page/components/search_text_field.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatefulWidget {
  const SearchBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBarContainer> createState() => _SearchBarContainerState();
}

class _SearchBarContainerState extends State<SearchBarContainer> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Reveal back button when text field is focused
        if (ExplorePage.searchFieldIsFocused)
          BackButton(
            onPressed: () => setState(() {
              ExplorePage.searchFieldIsFocused = false;
              FocusScope.of(context).requestFocus(focusNode);
            }),
            color: ColourStyles.mainText,
          ),
        // [START Search box/field]
        SearchTextField(
          onTap: () => setState(() {
            ExplorePage.searchFieldIsFocused = true;
          }),
          onEditingComplete: () => setState(() {
            ExplorePage.searchFieldIsFocused = false;

            FocusScope.of(context).requestFocus(focusNode);
          }),
        ),
        // [END Search box/field]
      ],
    );
  }
}
