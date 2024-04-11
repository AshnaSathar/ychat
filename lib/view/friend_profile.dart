import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

class Friend_profile_page extends StatefulWidget {
  const Friend_profile_page({super.key});

  @override
  State<Friend_profile_page> createState() => _Friend_profile_pageState();
}

class _Friend_profile_pageState extends State<Friend_profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width,
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .2,
                    color: Colors.green,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * .1,
                  )
                ],
              ),
              Positioned(
                left: 45,
                top: MediaQuery.sizeOf(context).height * .1,
                child: CircleAvatar(
                  radius: 65,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Color_constant.secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Provider.of<Profile_provider>(context, listen: false)
                          .userName,
                      style: Text_style_constant.H2_white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 8),
            child: Container(
              width: MediaQuery.sizeOf(context).width / 1.5,
              child: Text(
                "It has survived not only five centuries, but also the leap into electronic typesetting,",
                textAlign: TextAlign.justify,
                style: Text_style_constant.H4_white,
                maxLines: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    bool success = await Provider.of<Friendship_provider>(
                            context,
                            listen: false)
                        .add_friend(
                            user_id: Provider.of<Login_provider>(context,
                                    listen: false)
                                .user_id,
                            token: Provider.of<Login_provider>(context,
                                    listen: false)
                                .token,
                            friend_uid: Provider.of<Profile_provider>(context,
                                    listen: false)
                                .user_id);
                    if (success) {
                      show_bottom_sheet(
                          context: context,
                          data_to_display: "Added to your Friend List");
                    }
                    //
                  },
                  child: Small_container_refactor(
                      context: context, data_to_display: "Friends"),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .02,
                ),
                Small_container_refactor(
                    context: context, data_to_display: "Message"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
                onTap: () async {
                  bool success = await Provider.of<Friendship_provider>(context,
                          listen: false)
                      .block_user(
                          user_id: Provider.of<Login_provider>(context,
                                  listen: false)
                              .user_id,
                          friend_id: Provider.of<Profile_provider>(context,
                                  listen: false)
                              .user_id,
                          token: Provider.of<Login_provider>(context,
                                  listen: false)
                              .token);
                  if (success) {
                    show_bottom_sheet(
                        context: context, data_to_display: "Blocked");
                  } else {
                    show_bottom_sheet(
                        context: context, data_to_display: "Try again later");
                  }
                },
                child: Large_container_refactor(
                    context: context,
                    data_to_display: "Block User",
                    icon_name: Icon(
                      Icons.block,
                      color: Color_constant.secondaryColor,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: InkWell(
                onTap: () {
                  //
                },
                child: Large_container_refactor(
                    context: context,
                    data_to_display: "Report User",
                    icon_name: Icon(
                      Icons.thumb_down_off_alt_outlined,
                      color: Color_constant.secondaryColor,
                    ))),
          )
        ],
      ),
    );
  }

  Large_container_refactor(
      {required context, required data_to_display, required Icon icon_name}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color_constant.secondaryColor),
          borderRadius: BorderRadius.circular(5)),
      height: MediaQuery.sizeOf(context).height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon_name,
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .05,
          ),
          Text(
            "$data_to_display",
            style: Text_style_constant.H4_white,
          )
        ],
      ),
    );
  }

  Small_container_refactor({required context, required data_to_display}) {
    return Container(
      decoration: BoxDecoration(
        color: Color_constant.secondaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: MediaQuery.sizeOf(context).width * .46,
      height: MediaQuery.sizeOf(context).height * .05,
      child: Center(
        child: Text(
          "$data_to_display",
          style: Text_style_constant.H2_white,
        ),
      ),
    );
  }
}
