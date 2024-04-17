import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Change_mob_number_page extends StatefulWidget {
  const Change_mob_number_page({Key? key}) : super(key: key);

  @override
  State<Change_mob_number_page> createState() => _Change_mob_number_pageState();
}

class _Change_mob_number_pageState extends State<Change_mob_number_page> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    final normalPadding = screenHeight * .8;
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Change Number", context: context),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 75,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/Group.svg",
                  width: MediaQuery.sizeOf(context).width * .8,
                  height: MediaQuery.sizeOf(context).width * .8,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Changing your phone number will migrate your account info, group & settings.",
              style: Text_style_constant.H4_white.copyWith(
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Before proceeding, please confirm that you are able to receive SMS or calls at your new number.",
              style: Text_style_constant.H4_white_100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "If you have both a new phone & a new number, first change your number on your old phone.",
              style: Text_style_constant.H4_white_100,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: buttonPadding),
            child: InkWell(
                onTap: () {
                  context.go('/change_mob_num_page_2');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Change_mob_number_page_2(),
                  //     ));
                },
                child: Button(text: "Next", context: context)),
          ),
        ],
      ),
    );
  }
}
