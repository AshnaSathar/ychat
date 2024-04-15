import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/password_recovery.dart';
import 'package:flutter_application_1/controller/register_provider.dart';
import 'package:flutter_application_1/view/password_recovery/create_password_page.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/circle_avatar.dart';
import 'package:flutter_application_1/widgets/email_text_field.dart';
import 'package:provider/provider.dart';

class Email_verification_page extends StatefulWidget {
  final email_id;
  const Email_verification_page({super.key, required this.email_id});

  @override
  State<Email_verification_page> createState() =>
      _Email_verification_pageState();
}

class _Email_verification_pageState extends State<Email_verification_page> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email_provider = Provider.of<Email_provider>(context, listen: false);
    var password_recovey_provider =
        Provider.of<Password_recovery_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Verify your Email", context: context),
      body: Column(
        children: [
          Center(
            child: circle_avatar(content: "assets/email.png", context: context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please Enter The 4 Digit Code Send To",
              style: Text_style_constant.H4_white,
            ),
          ),
          Text(
            widget.email_id,
            style: Text_style_constant.H4_white,
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: TextField(
                        controller: c1,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        maxLength: 1,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color_constant.secondaryColor)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color_constant.secondaryColor)),
                            counter: Text(" "),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color_constant.secondaryColor),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    height: MediaQuery.sizeOf(context).height * .08,
                    width: MediaQuery.sizeOf(context).width * .15,
                    decoration: BoxDecoration(
                        color: Color_constant.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextField(
                      controller: c2,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          counter: Text(" "),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    height: MediaQuery.sizeOf(context).height * .08,
                    width: MediaQuery.sizeOf(context).width * .15,
                    decoration: BoxDecoration(
                        color: Color_constant.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color_constant.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: c3,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          counter: Text(" "),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    height: MediaQuery.sizeOf(context).height * .08,
                    width: MediaQuery.sizeOf(context).width * .15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextField(
                      controller: c4,
                      onChanged: (value) {
                        if (value.length == 1) {}
                      },
                      maxLength: 1,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor)),
                          counter: Text(" "),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color_constant.secondaryColor),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    height: MediaQuery.sizeOf(context).height * .08,
                    width: MediaQuery.sizeOf(context).width * .15,
                    decoration: BoxDecoration(
                        color: Color_constant.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              bool success = await password_recovey_provider.send_otp(
                  email: email_provider.email_controller.text);
              if (success) {
                show_bottom_sheet(
                    context: context,
                    data_to_display: "We send OTP again.Check Your Email.");
              } else {
                show_bottom_sheet(
                    context: context,
                    data_to_display:
                        "Your request can't process this time. Try again later.");
                Navigator.pop(context);
              }
            },
            child: Text(
              "Resend Code",
              style: Text_style_constant.H4_white,
            ),
          ),
          InkWell(
              onTap: () async {
                if (c1.text.isNotEmpty &&
                    c2.text.isNotEmpty &&
                    c3.text.isNotEmpty &&
                    c4.text.isNotEmpty) {
                  var otp = c1.text + c2.text + c3.text + c4.text;

                  if (otp.length == 4) {
                    bool success = await Provider.of<Register_provider>(context,
                            listen: false)
                        .verify_otp_register(otp: otp);
                    if (success) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Create_password_page(
                              email_id: email_provider.email_controller.text,
                            ),
                          ));
                    } else {
                      show_bottom_sheet(
                          context: context,
                          data_to_display: "Try again later !failed");
                    }
                  } else {
                    show_bottom_sheet(
                        context: context, data_to_display: "Invalid otp");
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Button(text: "verify", context: context),
              ))
        ],
      ),
    );
  }
}
