import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/update_password.dart';
import 'package:flutter_application_1/view/profile/password_success_page.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';
import 'package:provider/provider.dart';

class Update_password_page extends StatefulWidget {
  const Update_password_page({super.key});

  @override
  State<Update_password_page> createState() => _Update_password_pageState();
}

class _Update_password_pageState extends State<Update_password_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController current_password_controller = TextEditingController();
    TextEditingController new_password_controller = TextEditingController();
    TextEditingController confirm_password_controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            app_bar(title: "Create a new password", context: context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Set your new password so ypu can login and access ynotz.",
                style: Text_style_constant.H4_white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Current password",
                    style: Text_style_constant.H4_white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PasswordTextField(
                  context: context, controller: current_password_controller),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "New password",
                    style: Text_style_constant.H4_white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PasswordTextField(
                  context: context, controller: new_password_controller),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Confirm password",
                    style: Text_style_constant.H4_white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PasswordTextField(
                  context: context, controller: confirm_password_controller),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {
                    if (confirm_password_controller.text.isNotEmpty &&
                        new_password_controller.text.isNotEmpty &&
                        current_password_controller.text.isNotEmpty) {
                      if (new_password_controller.text ==
                          confirm_password_controller.text) {
                        bool success =
                            await Provider.of<Update_password_provider>(context,
                                    listen: false)
                                .update_password(
                                    user_id: Provider.of<Login_provider>(
                                            context,
                                            listen: false)
                                        .user_id,
                                    old_password:
                                        current_password_controller.text,
                                    new_password: new_password_controller.text,
                                    new_password_confirmation:
                                        confirm_password_controller.text);
                        if (success) {
                          // show_bottom_sheet(
                          //     context: context,
                          //     data_to_display: "Updated successfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Password_success_page(),
                              ));
                        } else {
                          show_bottom_sheet(
                              context: context,
                              data_to_display:
                                  "Failed to change password. Try again later");
                        }
                      } else {
                        show_bottom_sheet(
                            context: context,
                            data_to_display: "Password not match");
                      }
                    } else {
                      show_bottom_sheet(
                          context: context,
                          data_to_display: "You must enter every fields");
                    }
                  },
                  child: Button(text: "Request password", context: context)),
            )
          ],
        ),
      ),
    );
  }
}
