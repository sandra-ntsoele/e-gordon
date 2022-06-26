import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/index_app_bar.dart';
import 'package:e_gordon/view/components/index_bottom_app_bar.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final List<Widget> _pages = [];
  int _pageIndex = 0;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    _pages.add(const ExplorePage());
    _pages.add(const ShoppingListScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.currentUser;
    if (currentUser == null) {
      Navigator.of(context).pushNamed("/login");
    } else if (!currentUser.emailVerified) {
      Navigator.of(context).pushNamed("/registration-verification");
    }
    return StreamBuilder(
      stream: _authService.userStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: IndexAppBar(currentUser: currentUser),
            bottomNavigationBar: IndexBottomAppBar(
              onTap: (int indexOfSelected) {
                setState(() => _pageIndex = indexOfSelected);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {},
              child: const Icon(Icons.create_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: _pages[_pageIndex],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
