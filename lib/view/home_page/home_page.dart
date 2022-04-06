import 'package:e_gordon/view/home_page/components/custom_bottom_navbar.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final List<Widget> _pages = [];
  String selectedItem = "";

  @override
  void initState() {
    _pages.add(const HomePage());
    _pages.add(const SignIn());
    _pages.add(const MyProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Home",
            style: TextStyle(),
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              Navigator.pushNamed(
                context,
                value.toString(),
              );
            },
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                const PopupMenuItem(
                  value: "/settings",
                  child: Text("Settings"),
                ),
                const PopupMenuItem(
                  value: "/profile",
                  child: Text("Profile"),
                ),
              ];
            },
          ),
        ],
        // [START Appbar styling]
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: ColourStyles.mainText,
        // [END Appbar styling]
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create_outlined),
        backgroundColor: ColourStyles.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavbar(
        onTap: (itemIndex) => setState(() => pageIndex = itemIndex),
      ),
      body: const HomePageContent(),
    );
  }
}
