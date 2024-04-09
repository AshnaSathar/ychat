import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/view/home/home_page.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/circle_avatar.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';

class Create_password_page extends StatelessWidget {
  const Create_password_page({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password_controller = TextEditingController();
    TextEditingController confirm_password_controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Create New Password", context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  circle_avatar(content: "assets/lock.png", context: context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your New Password Must Be Different",
              style: Text_style_constant.H2_white_bold,
            ),
          ),
          Center(
              child: Text(
            " From Previously Used Password",
            style: Text_style_constant.H2_white_bold,
          )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "New Password",
                  style: Text_style_constant.content_style_white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordTextField(
                context: context, controller: password_controller),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Confirm Password",
                  style: Text_style_constant.content_style_white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordTextField(
                context: context, controller: confirm_password_controller),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_page(),
                      ));
                },
                child: Button(text: "Save", context: context)),
          )
        ],
      ),
    );
  }
}
