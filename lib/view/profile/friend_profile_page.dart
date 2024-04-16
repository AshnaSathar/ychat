import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/view/chat_page/personalChatPage.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

class Friend_profile_page extends StatefulWidget {
  const Friend_profile_page({Key? key}) : super(key: key);

  @override
  State<Friend_profile_page> createState() => _Friend_profile_pageState();
}

class _Friend_profile_pageState extends State<Friend_profile_page> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width,
                    child: Provider.of<Profile_provider>(context, listen: false)
                                .cover_image_url !=
                            null
                        ? Image.network(
                            "${Provider.of<Profile_provider>(context, listen: false).cover_image}",
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://img.freepik.com/premium-photo/blurred-colorful-wallpaper-background_976742-179.jpg",
                            fit: BoxFit.fill,
                          ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .1,
                  )
                ],
              ),
              Positioned(
                left: 45,
                top: MediaQuery.of(context).size.height * .1,
                child: CircleAvatar(
                  radius: 65,
                  child: CircleAvatar(
                    maxRadius: 55,
                    backgroundImage: profile_provider.profile_picture_url !=
                            null
                        ? NetworkImage(
                            profile_provider.profile_image!,
                          )
                        : NetworkImage(
                            "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color_constant.secondaryColor,
                      ),
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
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                Provider.of<Profile_provider>(context, listen: false).bio,
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
                    context: context,
                    data_to_display: "Friends",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                InkWell(
                  onTap: () {
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chat_Page(
                          id: Provider.of<Profile_provider>(context,
                                  listen: false)
                              .user_id,
                          name: Provider.of<Profile_provider>(context,
                                  listen: false)
                              .userName,
                        ),
                      ),
                    );
                  },
                  child: Small_container_refactor(
                    context: context,
                    data_to_display: "Message",
                  ),
                )
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
                        user_id:
                            Provider.of<Login_provider>(context, listen: false)
                                .user_id,
                        friend_id: Provider.of<Profile_provider>(context,
                                listen: false)
                            .user_id,
                        token:
                            Provider.of<Login_provider>(context, listen: false)
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
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text(
                            "Report User",
                            style: Text_style_constant.H2_purple,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "The last 5 messages from this contact will be forwarded to Ynotz. If you block this contact and delete the chat, messages will only be removed from this device and your devices on the newer versions of ynotz.\n\n This contact will not be notified",
                                style: Text_style_constant.H4_purple,
                              ),
                              Row(
                                children: [
                                  // Checkbox
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Block Contact and delete chat",
                                    style: Text_style_constant.H4_purple,
                                  )
                                ],
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (isChecked) {
                                  Provider.of<Friendship_provider>(context,
                                          listen: false)
                                      .block_user(
                                    user_id: Provider.of<Login_provider>(
                                            context,
                                            listen: false)
                                        .user_id,
                                    friend_id: Provider.of<Profile_provider>(
                                            context,
                                            listen: false)
                                        .user_id,
                                    token: Provider.of<Login_provider>(context,
                                            listen: false)
                                        .token,
                                  );
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text('Report'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Large_container_refactor(
                context: context,
                data_to_display: "Report User",
                icon_name: Icon(
                  Icons.thumb_down_off_alt_outlined,
                  color: Color_constant.secondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Large_container_refactor(
      {required BuildContext context,
      required String data_to_display,
      required Icon icon_name}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color_constant.secondaryColor),
        borderRadius: BorderRadius.circular(5),
      ),
      height: MediaQuery.of(context).size.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon_name,
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Text(
            "$data_to_display",
            style: Text_style_constant.H4_white,
          )
        ],
      ),
    );
  }

  Widget Small_container_refactor(
      {required BuildContext context, required String data_to_display}) {
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
      width: MediaQuery.of(context).size.width * .46,
      height: MediaQuery.of(context).size.height * .05,
      child: Center(
        child: Text(
          "$data_to_display",
          style: Text_style_constant.H2_purple,
        ),
      ),
    );
  }
}
