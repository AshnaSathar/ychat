import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/view/settings/change_mobile_number/change_mob_num_page_3.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:go_router/go_router.dart';

class Change_mob_number_page_2 extends StatefulWidget {
  const Change_mob_number_page_2({super.key});

  @override
  State<Change_mob_number_page_2> createState() =>
      _Change_mob_number_page_2State();
}

class _Change_mob_number_page_2State extends State<Change_mob_number_page_2> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Change Number", context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Enter your old phone number with country code:",
                  style: Text_style_constant.H4_white_100,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: Text_style_constant.H4_white_100,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color_constant.secondaryColor.withOpacity(.9))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color_constant.secondaryColor.withOpacity(.3))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color_constant.secondaryColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Enter your new phone number with country code:",
                  style: Text_style_constant.H4_white_100,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: Text_style_constant.H4_white_100,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color_constant.secondaryColor.withOpacity(.9))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color_constant.secondaryColor.withOpacity(.3))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color_constant.secondaryColor),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: buttonPadding),
            child: InkWell(
                onTap: () {
                  context.push('/change_mob_number_page_3');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Change_mob_number_page_3(),
                  //     ));
                },
                child: Button(text: "Next", context: context)),
          ),
        ],
      ),
    );
  }
}
