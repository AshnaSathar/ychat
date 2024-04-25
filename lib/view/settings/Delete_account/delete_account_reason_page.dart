import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';

class Delete_account_reason_page extends StatelessWidget {
  const Delete_account_reason_page({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Delete Account", context: context),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 08,
          top: 30,
          left: 30,
        ),
        child: Column(
          children: [
            Text(
              "We hate to see you leave! Tell us why you are deleting  your account:",
              style: Text_style_constant.H4_white_100,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu(
                    hintText: "Select a reason",
                    textStyle: Text_style_constant.H4_white_100,
                    width: MediaQuery.sizeOf(context).width * .7,
                    // trailingIcon: Icon(
                    //   Icons.arrow_drop_down,
                    //   color: Colors.white,
                    // ),
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: Text_style_constant.H4_white_100,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor
                                    .withOpacity(.3))),
                        hintStyle: Text_style_constant.H4_white_100,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        border: UnderlineInputBorder()),
                    enableFilter: true,
                    menuStyle: MenuStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color_constant.primaryColor)),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        labelWidget: Text(
                          "I need to change my email Id",
                          style: Text_style_constant.H4_white_100,
                        ),
                        value: 1,
                        label: "I need to change my email Id",
                      ),
                      DropdownMenuEntry(
                        labelWidget: Text(
                          "I am deleting my account temperorly",
                          style: Text_style_constant.H4_white_100,
                        ),
                        value: 2,
                        label: "I am deleting my account temperorly",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: buttonPadding),
              child: Button(text: "Delete Account", context: context),
            )
          ],
        ),
      ),
    );
  }
}
