import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/update_mob_num.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Change_mob_number_page_3 extends StatefulWidget {
  final new_mob;
  const Change_mob_number_page_3({super.key, required this.new_mob});
  @override
  State<Change_mob_number_page_3> createState() =>
      _Change_mob_number_page_3State();
}

class _Change_mob_number_page_3State extends State<Change_mob_number_page_3> {
  var mobile_number;
  initState() {
    getData();
  }

  Future getData() async {
    mobile_number = Provider.of<Profile_provider>(context, listen: false)
        .profile_my_details
        ?.user
        .mobileNumber;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonPadding = screenHeight * 0.05;
    var current_number = mobile_number;
    var new_number = widget.new_mob;
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
                onTap: () async {
                  bool success = await Provider.of<Mob_num_provider>(context,
                          listen: false)
                      .update_mob(
                          newMob: new_number,
                          userId: Provider.of<Login_provider>(context,
                                  listen: false)
                              .user_id,
                          token: Provider.of<Login_provider>(context,
                                  listen: false)
                              .token);

                  (success)
                      ? show_bottom_sheet(
                              context: context, data_to_display: "success")
                          .then((_) {
                          context.go('/home_page');
                        })
                      : show_bottom_sheet(
                              context: context, data_to_display: "failed")
                          .then((_) {
                          context.go('/home_page');
                        });
                  // context.go('/home_page');
                },
                child: Button(text: "Done", context: context)),
          ),
        ],
      ),
    );
  }
}
