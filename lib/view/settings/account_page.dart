import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/view/profile/update_password_page.dart';
import 'package:flutter_application_1/view/public_rooms/room_chat_page.dart';
import 'package:flutter_application_1/view/settings/change_mob_num_page.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Account_page extends StatefulWidget {
  const Account_page({Key? key}) : super(key: key);

  @override
  State<Account_page> createState() => _Account_pageState();
}

class _Account_pageState extends State<Account_page> {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> content = {
      "Reset password": Update_password_page(),
      "Number changing": Change_mob_number_page(),
      "Delete account": Room_chat_page(),
      "App info": Room_chat_page(),
    };

    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Account", context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: content.entries.map((entry) {
            String key = entry.key;
            Widget page = entry.value;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
                child: Text(
                  key,
                  style: Text_style_constant.H4_white,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
