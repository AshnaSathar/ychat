import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';

class Change_mob_number_page_3 extends StatefulWidget {
  const Change_mob_number_page_3({super.key});

  @override
  State<Change_mob_number_page_3> createState() =>
      _Change_mob_number_page_3State();
}

class _Change_mob_number_page_3State extends State<Change_mob_number_page_3> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    var current_number = "9999999999";
    var new_number = "0877729972";
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Change Number", context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "You are about to change your number from +91$current_number to +91$new_number",
              style: Text_style_constant.H4_white_100,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: buttonPadding),
            child: InkWell(
                onTap: () {}, child: Button(text: "Done", context: context)),
          ),
        ],
      ),
    );
  }
}
