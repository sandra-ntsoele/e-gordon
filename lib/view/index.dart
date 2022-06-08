import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/index_app_bar.dart';
import 'package:e_gordon/view/components/index_bottom_app_bar.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final userStream = AuthService().userStateStream;
  final List<Widget> _pages = [];
  int _pageIndex = 0;

  @override
  void initState() {
    _pages.add(const ExplorePage());
    _pages.add(const ShoppingListScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignIn();
        } else {
          final User? currentUser = AuthService().user;
          return Scaffold(
            appBar: IndexAppBar(currentUser: currentUser),
            bottomNavigationBar: IndexBottomAppBar(
              onTap: (int indexOfSelected) {
                setState(() => _pageIndex = indexOfSelected);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.create_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: _pages[_pageIndex],
          );
        }
      },
    );
  }
}
