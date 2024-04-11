import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:provider/provider.dart';

class Edit_profile_page extends StatefulWidget {
  const Edit_profile_page({super.key});

  @override
  State<Edit_profile_page> createState() => _Edit_profile_pageState();
}

class _Edit_profile_pageState extends State<Edit_profile_page> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController dob_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();
  TextEditingController mobile_number_controller = TextEditingController();
  TextEditingController bio_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Edit Profile", context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * .5,
                height: MediaQuery.sizeOf(context).height * .2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color_constant.secondaryColor,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(2, 2),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(-2, -2),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: NetworkImage(
                                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Name",
                        style: Text_style_constant.H4_white,
                      ),
                    ],
                  ),
                  TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bio",
                        style: Text_style_constant.H4_white,
                      ),
                    ],
                  ),
                  TextField(
                    controller: bio_controller,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  Row(
                    children: [
                      Text(
                        "Phone Number",
                        style: Text_style_constant.H4_white,
                      ),
                    ],
                  ),
                  TextField(
                    controller: mobile_number_controller,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: Text_style_constant.H4_white,
                      ),
                    ],
                  ),
                  TextField(
                    controller: gender_controller,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_constant.secondaryColor)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
              onTap: () async {
                bool success = await Provider.of<Profile_provider>(context,
                        listen: false)
                    .update_profile(
                        id: Provider.of<Login_provider>(context, listen: false)
                            .user_id,
                        name: name_controller.text,
                        reference_id:
                            Provider.of<Login_provider>(context, listen: false)
                                .token,
                        gender: gender_controller.text,
                        mobile_number: mobile_number_controller.text,
                        dob: dob_controller.text,
                        bio: bio_controller.text);
                name_controller.clear();
                gender_controller.clear();
                mobile_number_controller.clear();
                dob_controller.clear();
                if (success) {
                  show_bottom_sheet(
                      context: context, data_to_display: "success");
                } else {
                  show_bottom_sheet(
                      context: context, data_to_display: "failed");
                }
              },
              child: Button(text: "Submit", context: context))
        ],
      ),
    );
  }
}
