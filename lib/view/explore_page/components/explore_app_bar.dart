import 'package:e_gordon/view/explore_page/components/explore_popup_menu.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class ExploreAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }

  final String title;

  const ExploreAppBar({Key? key, required this.title}) : super(key: key);

  @override
  State<ExploreAppBar> createState() => _ExploreAppBarState();
}

class _ExploreAppBarState extends State<ExploreAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: const [
        HomePopupMenu(),
      ],
      // [START Appbar styling]
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: ColourStyles.mainText,
      // [END Appbar styling]
    );
  }
}
