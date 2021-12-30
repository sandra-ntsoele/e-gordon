import 'package:e_gordon/view/components/profile_header.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, index) {
          return const [
            // Profile header
            SliverToBoxAdapter(child: ProfileHeader())
          ];
        },
        body: Text("Hello tabs"),
      ),
    );

    // Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {},
    //     child: const Icon(Icons.home_filled),
    //     backgroundColor: primaryColour,
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: BottomNavigationBar(
    //     onTap: (value) => {},
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.create_rounded),
    //         label: "Create",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(null),
    //         label: "Home",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: "Profile",
    //       ),
    //     ],
    //   ),
    //   body: SizedBox(
    //     width: double.infinity,
    //     height: size.height,
    //     child: Center(
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: size.height * 0.08,
    //           ),
    //           /* Avatar */
    //           CircleAvatar(
    //             backgroundImage: const NetworkImage("https://bit.ly/3zcOVBL"),
    //             radius: size.height * 0.06,
    //             backgroundColor: outlineColour,
    //           ),
    //           SizedBox(height: size.height * 0.03),
    //           /* User Name */
    //           const Heading(
    //             text: "Gordon Ramsay",
    //             headingType: 2,
    //           ),
    //           SizedBox(height: size.height * 0.03),
    //           /* Profile stats */
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Column(
    //                   children: const [
    //                     Heading(text: "32", headingType: 3),
    //                     Paragraph(text: "Recipes", paragraphType: 2),
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                 child: Column(
    //                   children: const [
    //                     Heading(text: "32", headingType: 3),
    //                     Paragraph(text: "Following", paragraphType: 2),
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                 child: Column(
    //                   children: const [
    //                     Heading(text: "32", headingType: 3),
    //                     Paragraph(text: "Followers", paragraphType: 2),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //           Divider(
    //             height: size.height * 0.05,
    //             thickness: 5,
    //             color: outlineColour,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
