import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/register_provider.dart';
import 'package:flutter_application_1/view/login/login_page.dart';
import 'package:flutter_application_1/view/password_recovery/email_verification.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Registration_page extends StatefulWidget {
  const Registration_page({super.key});

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  @override
  Widget build(BuildContext context) {
    var register_provider =
        Provider.of<Register_provider>(context, listen: false);
    TextEditingController name_controller = TextEditingController();
    TextEditingController email_controller = TextEditingController();
    TextEditingController user_name_controller = TextEditingController();
    TextEditingController dob_controller = TextEditingController();
    TextEditingController gender_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "", context: context),
      body: Column(
        children: [
          Center(
            child: Text(
              "ynotz",
              style: Text_style_constant.H1_white,
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 1.3,
            decoration: BoxDecoration(
              color: Color_constant.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(55),
                topRight: Radius.circular(55),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 30.0, left: 30, bottom: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Name",
                          style: Text_style_constant.normal_text,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height * .05,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: name_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: Text_style_constant.H4_purple),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Date Of Birth",
                          style: Text_style_constant.normal_text,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height * .05,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: dob_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "DOB",
                            hintStyle: Text_style_constant.H4_purple),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "User Name",
                          style: Text_style_constant.normal_text,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height * .05,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: user_name_controller,
                        decoration: InputDecoration(
                            hintStyle: Text_style_constant.H4_purple,
                            hintText: "User Name",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Email Address",
                          style: Text_style_constant.normal_text,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height * .05,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: email_controller,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: Text_style_constant.H4_purple,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Password",
                          style: Text_style_constant.normal_text,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height * .05,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: password_controller,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: Text_style_constant.H4_purple,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 8, right: 8, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color_constant.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: MediaQuery.sizeOf(context).height * .05,
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            if (name_controller.text.isNotEmpty &&
                                email_controller.text.isNotEmpty &&
                                dob_controller.text.isNotEmpty &&
                                password_controller.text.isNotEmpty) {
                              bool success =
                                  await register_provider.request_otp(
                                      user_name: user_name_controller.text,
                                      name: name_controller.text,
                                      dob: dob_controller.text,
                                      gender: gender_controller.text,
                                      password: password_controller.text,
                                      email_id: email_controller.text);
                              if (success) {
                                // ------router
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Email_verification_page(
                                        email_id: email_controller.text,
                                      ),
                                    ));
                              } else {
                                show_bottom_sheet(
                                    context: context,
                                    data_to_display:
                                        "Try again later!something went wrong");
                              }
                            } else {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display: "Every fields required");
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: Text_style_constant.content_style_bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Color_constant.primaryColor),
                        ),
                        InkWell(
                            onTap: () {
                              context.go('/login_page');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Login_page(),
                              //     ));
                            },
                            child: Text(
                              "Sign In",
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
