import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/recovery_password_provider.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/circle_avatar.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Create_password_page extends StatelessWidget {
  final email_id;
  const Create_password_page({super.key, required this.email_id});

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
              style: Text_style_constant.H3_white,
            ),
          ),
          Center(
              child: Text(
            " From Previously Used Password",
            style: Text_style_constant.H3_white,
          )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "New Password",
                  style: Text_style_constant.H4_white,
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
                  style: Text_style_constant.H4_white,
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
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
                onTap: () async {
                  if (password_controller.text ==
                      confirm_password_controller.text) {
                    bool get_details_success =
                        await Provider.of<recover_password_provider>(context,
                                listen: false)
                            .get_user_details(email_id: this.email_id);
                    if (get_details_success) {
                      bool success =
                          await Provider.of<recover_password_provider>(context,
                                  listen: false)
                              .post_forget_password(
                                  password: password_controller.text,
                                  password_confirmation:
                                      confirm_password_controller.text);
                      if (success) {
                        // print("true");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Home_page(),
                        //     ));
                        // Navigator.pushNamed(context, '/home_page');
                        context.go('/home_page');
                      } else {
                        show_bottom_sheet(
                            context: context, data_to_display: "try again");
                      }
                    }
                  } else {
                    show_bottom_sheet(
                        context: context,
                        data_to_display: "Both fields must be same");
                  }
                },
                child: Button(text: "Save", context: context)),
          )
        ],
      ),
    );
  }
}
