import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppbarContainer extends StatefulWidget {
  final String title;
  const AppbarContainer({Key? key, required this.title}) : super(key: key);

  @override
  State<AppbarContainer> createState() => _AppbarContainerState();
}

class _AppbarContainerState extends State<AppbarContainer> {
  Widget build(BuildContext context) {
    var isChecked_report = false;
    var isChecked_block = false;
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);

    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Color_constant.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                //
                context.push('/friend_profile_page');
                // Navigator.pushNamed(context, '/friend_profile_page');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Friend_profile_page(),
                //     ));
              },
              child: CircleAvatar(
                // maxRadius: 25,
                backgroundImage: profile_provider.profile_picture_url != null
                    ? NetworkImage(
                        profile_provider.profile_image!,
                      )
                    : NetworkImage(
                        "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
              ),
            ),
          ),
          Icon(
            Icons.circle,
            size: 15,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.video_call_sharp)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.call)),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            offset: Offset(0, 30),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('view contact'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Gallery'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Block'),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text('Report'),
                  value: 4,
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                context.push('/profile_page');
              } else if (value == 2) {
                context.push('/gallery_page');
              } else if (value == 3) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text(
                            "Block User",
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
                                    value: isChecked_block,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked_block = value!;
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
                                context.pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (isChecked_block) {
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
                                // Navigator.of(context).pop();
                                context.pop();
                              },
                              child: Text('Block'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              } else if (value == 4) {
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
                                    value: isChecked_report,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked_report = value!;
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
                                context.pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (isChecked_report) {
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
                                // Navigator.of(context).pop();
                                context.pop();
                              },
                              child: Text('Report'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(child: Icon(Icons.more_vert_sharp)),
          // )
        ],
      ),
    );
  }
}
