import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Profile_privacy_page extends StatefulWidget {
  const Profile_privacy_page({super.key});

  @override
  State<Profile_privacy_page> createState() => _Profile_privacy_pageState();
}

class _Profile_privacy_pageState extends State<Profile_privacy_page> {
  bool profile_everyone = false;
  bool profile_friends = false;
  bool profile_noOne = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Profile", context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Who can see when I'm online",
              style: Text_style_constant.H4_white_100,
            ),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Everyone',
              style: Text_style_constant.H4_white,
            ),
            value: profile_everyone,
            checkColor: Color_constant.primaryColor,
            hoverColor: Color_constant.secondaryColor,
            activeColor: Color_constant.secondaryColor,
            side: BorderSide(color: Colors.white),
            onChanged: (value) {
              setState(() {
                profile_everyone = value!;
                if (value) {
                  profile_friends = false;
                  profile_noOne = false;
                }
              });
            },
          ),
          CheckboxListTile(
            checkColor: Color_constant.primaryColor,
            hoverColor: Color_constant.secondaryColor,
            activeColor: Color_constant.secondaryColor,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Friends',
              style: Text_style_constant.H4_white,
            ),
            value: profile_friends,
            side: BorderSide(color: Colors.white),
            onChanged: (value) {
              setState(() {
                profile_friends = value!;
                if (value) {
                  profile_everyone = false;
                  profile_noOne = false;
                }
              });
            },
          ),
          CheckboxListTile(
            activeColor: Colors.white,
            checkColor: Color_constant.primaryColor,
            hoverColor: Color_constant.secondaryColor,
            side: BorderSide(color: Colors.white),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'No one',
              style: Text_style_constant.H4_white,
            ),
            value: profile_noOne,
            onChanged: (value) {
              setState(() {
                profile_noOne = value!;
                if (value) {
                  profile_everyone = false;
                  profile_friends = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
