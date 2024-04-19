import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:go_router/go_router.dart';

class Delete_account_page extends StatefulWidget {
  const Delete_account_page({super.key});

  @override
  State<Delete_account_page> createState() => _Delete_account_pageState();
}

class _Delete_account_pageState extends State<Delete_account_page> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Delete Account", context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "If you delete this account:",
                        style: Text_style_constant.H4_white,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                        "The account will be deleted from Ynotz and all your devices",
                        style: Text_style_constant.H4_white_100,
                      ),
                      Text(
                        "Your message history will be erased",
                        style: Text_style_constant.H4_white_100,
                      ),
                      Text(
                        "You will be removed from all your Ynotz groups",
                        style: Text_style_constant.H4_white_100,
                      ),
                      Text(
                        "Your storage backup will be deleted",
                        style: Text_style_constant.H4_white_100,
                      ),
                      Text(
                        "Any rooms you created will be deleted",
                        style: Text_style_constant.H4_white_100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "To delete your account, confirm your country code and enter your phone number.",
                style: Text_style_constant.H3_white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Text(
                "Phone",
                style: Text_style_constant.H4_white_100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .1,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(.4))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .7,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(.4))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: buttonPadding),
                child: InkWell(
                    onTap: () {
                      context.push('/delete_account_reason_page');
                    },
                    child: Button(text: "Next", context: context)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
