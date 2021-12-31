import 'package:e_gordon/view/profile/components/profile_statistic.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage("https://bit.ly/3zcOVBL"),
          radius: size.height * 0.06,
          backgroundColor: outlineColour,
        ),
        SizedBox(height: size.height * 0.03),
        /* User Name */
        const Heading(
          text: "Gordon Ramsay",
          headingType: 2,
        ),
        SizedBox(height: size.height * 0.03),
        /* Profile stats */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ProfileStatistic(
              label: "Recipes",
              figure: "32",
            ),
            ProfileStatistic(
              label: "Followers",
              figure: "1287",
            ),
            ProfileStatistic(
              label: "Following",
              figure: "782",
            ),
          ],
        ),
      ],
    );
  }
}
