import 'package:e_gordon/view/explore_page/components/explore_app_bar.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class MainCustomAppBar extends StatefulWidget implements ExploreAppBar {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  final String title;

  const MainCustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  State<MainCustomAppBar> createState() => _MainCustomAppBarState();
}

class _MainCustomAppBarState extends State<MainCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.white,
      foregroundColor: ColourStyles.mainText,
    );
  }
}
