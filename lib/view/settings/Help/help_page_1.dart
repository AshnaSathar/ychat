import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:go_router/go_router.dart';

class Help_page_1 extends StatefulWidget {
  const Help_page_1({super.key});

  @override
  State<Help_page_1> createState() => _Help_page_1State();
}

class _Help_page_1State extends State<Help_page_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Help", context: context),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.push('/help_center');
            },
            child: ListTile(
              title: Text(
                "Help center",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "Get help, contact us",
                style: Text_style_constant.H5_white_100,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/terms_and_privacy');
            },
            child: ListTile(
              title: Text(
                "Terms and privacy policy",
                style: Text_style_constant.H4_white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
