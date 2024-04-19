import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Status_privacy_page extends StatefulWidget {
  const Status_privacy_page({super.key});

  @override
  State<Status_privacy_page> createState() => _Status_privacy_pageState();
}

class _Status_privacy_pageState extends State<Status_privacy_page> {
  bool online_everyone_Selected = false;
  bool online_friends_Selected = false;
  bool online_no_one_selected = false;

  bool last_seen_everyone_Selected = false;
  bool last_seen_friends_Selected = false;
  bool last_seen_no_one_selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Last seen and online", context: context),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Who can see my last seen",
                  style: Text_style_constant.H4_white_100,
                ),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Everyone',
                  style: Text_style_constant.H4_white,
                ),
                value: last_seen_everyone_Selected,
                checkColor: Color_constant.primaryColor,
                hoverColor: Color_constant.secondaryColor,
                activeColor: Color_constant.secondaryColor,
                side: BorderSide(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    last_seen_everyone_Selected = value!;
                    if (value) {
                      last_seen_friends_Selected = false;
                      last_seen_no_one_selected = false;
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
                value: last_seen_friends_Selected,
                side: BorderSide(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    last_seen_friends_Selected = value!;
                    if (value) {
                      online_everyone_Selected = false;
                      last_seen_no_one_selected = false;
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
                value: last_seen_no_one_selected,
                onChanged: (value) {
                  setState(() {
                    last_seen_no_one_selected = value!;
                    if (value) {
                      last_seen_everyone_Selected = false;
                      last_seen_friends_Selected = false;
                    }
                  });
                },
              ),
            ],
          ),
          Column(
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
                value: online_everyone_Selected,
                checkColor: Color_constant.primaryColor,
                hoverColor: Color_constant.secondaryColor,
                activeColor: Color_constant.secondaryColor,
                side: BorderSide(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    online_everyone_Selected = value!;
                    if (value) {
                      online_friends_Selected = false;
                      online_no_one_selected = false;
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
                value: online_friends_Selected,
                side: BorderSide(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    online_friends_Selected = value!;
                    if (value) {
                      online_everyone_Selected = false;
                      online_no_one_selected = false;
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
                value: online_no_one_selected,
                onChanged: (value) {
                  setState(() {
                    online_no_one_selected = value!;
                    if (value) {
                      online_everyone_Selected = false;
                      online_friends_Selected = false;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
