import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/password_recovery.dart';
import 'package:flutter_application_1/view/password_recovery/email_verification.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/circle_avatar.dart';
import 'package:flutter_application_1/widgets/email_text_field.dart';
import 'package:provider/provider.dart';

class Forgot_password extends StatelessWidget {
  const Forgot_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Forget password", context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: circle_avatar(
                    content: "assets/lock.png", context: context)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 5),
            child: Center(
              child: Text(
                "Please Enter Your Email Address",
                style: Text_style_constant.H3_white,
              ),
            ),
          ),
          Center(
            child: Text(
              "To Receive A verification Code.",
              style: Text_style_constant.H3_white,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 8, left: 8, bottom: 8),
            child: Row(
              children: [
                Text(
                  "Email Address",
                  style: Text_style_constant.H4_white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Email_text_field(context: context),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                  onTap: () async {
                    CircularProgressIndicator();
                    bool success =
                        await Provider.of<Password_recovery_provider>(context,
                                listen: false)
                            .send_otp(
                                email: Provider.of<Email_provider>(context,
                                        listen: false)
                                    .email_controller
                                    .text);
                    if (success) {
                      // -----router

                      Provider.of<Email_provider>(context, listen: false)
                          .email_controller
                          .clear();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Email_verification_page(
                              email_id: Provider.of<Email_provider>(context,
                                      listen: false)
                                  .email_controller
                                  .text,
                            ),
                          ));
                    } else {
                      // print("something happens");
                      show_bottom_sheet(
                          context: context,
                          data_to_display:
                              "${Provider.of<Password_recovery_provider>(context, listen: false).message}");
                      Provider.of<Email_provider>(context, listen: false)
                          .email_controller
                          .clear();
                    }
                  },
                  child: Button(text: "Send", context: context))),
        ],
      ),
    );
  }
}
