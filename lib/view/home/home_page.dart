import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/close_friends_provider.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:flutter_application_1/view/active_rooms/active_chats_page.dart';
import 'package:flutter_application_1/view/home/h2.dart';
import 'package:flutter_application_1/view/home/h1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});
  @override
  State<Home_page> createState() => _Home_pageState();
}

late List<Friend> friendsList;

class _Home_pageState extends State<Home_page> {
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    try {
      await Provider.of<Profile_provider>(context, listen: false).get_details(
          id: Provider.of<Login_provider>(context, listen: false).user_id,
          reference_id:
              Provider.of<Login_provider>(context, listen: false).token);
      await Provider.of<Friendship_provider>(context, listen: false)
          .get_friends(
              user_id:
                  Provider.of<Login_provider>(context, listen: false).user_id,
              token: Provider.of<Login_provider>(context, listen: false).token);
      // await Provider.of<All_users_provider>(context, listen: false).getUsers(
      //     token: Provider.of<Login_provider>(context, listen: false).token);

      setState(() {
        friendsList = Provider.of<Friendship_provider>(context, listen: false)
                .friendsModel
                ?.friends ??
            [];
      });
      // await Provider.of<All_users_provider>(context, listen: false).getUsers(
      //   token: Provider.of<Login_provider>(context, listen: false).token,
      // );
      Provider.of<Friendship_provider>(context, listen: false).length =
          Provider.of<Friendship_provider>(context, listen: false)
              .friendsModel
              ?.friends
              .length;
      Provider.of<Profile_provider>(context, listen: false).get_my_details(
          id: Provider.of<Login_provider>(context, listen: false).user_id,
          reference_id:
              Provider.of<Login_provider>(context, listen: false).token);
      Provider.of<Rooms_provider>(context, listen: false).fetch_rooms_data(
          token: Provider.of<Login_provider>(context, listen: false).token);
      Provider.of<Profile_provider>(context, listen: false).get_my_details(
          id: Provider.of<Login_provider>(context, listen: false).user_id,
          reference_id:
              Provider.of<Login_provider>(context, listen: false).token);
      await Provider.of<close_friends_provider>(context, listen: false)
          .get_list(
              token: Provider.of<Login_provider>(context, listen: false).token,
              user_id:
                  Provider.of<Login_provider>(context, listen: false).user_id);
    } catch (error) {
      print("error is $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.secondaryColor,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Consumer<Profile_provider>(
                builder: (context, value, child) => Home_pageAppbar()),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.group,
                    size: 16,
                  ),
                  child: Text("Chats", style: Text_style_constant.tab_style),
                ),
                Tab(
                  icon: Icon(Icons.groups_3_sharp),
                  child: Text("Rooms", style: Text_style_constant.tab_style),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    "assets/active_chats.svg",
                    width: MediaQuery.sizeOf(context).width * .05,
                    height: MediaQuery.sizeOf(context).width * .05,
                  ),
                  child:
                      Text("Acive chats", style: Text_style_constant.tab_style),
                ),
                // Tab(
                //     icon: SvgPicture.asset(
                //       "assets/fav_chats.svg",
                //       height: MediaQuery.sizeOf(context).height * .05,
                //       width: MediaQuery.sizeOf(context).width * .05,
                //     ),
                //     child: Text("Favorites",
                //         style: Text_style_constant.tab_style)),
              ],
            ),
            Expanded(
              child: Consumer<Friendship_provider>(
                builder: (context, value, child) {
                  return TabBarView(
                    children: [
                      // Content of Tab 1
                      // Home_front_body(),
                      (Provider.of<Friendship_provider>(context, listen: false)
                              .isLoading)
                          ? CircularProgressIndicator()
                          : H1(),
                      // Content of Tab 2

                      H2(),
                      // Content of Tab 3
                      Active_chat_page(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home_pageAppbar extends StatelessWidget {
  const Home_pageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
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
      height: height * .1,
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                context.push('/profile_page');
              },
              child: CircleAvatar(
                backgroundImage: profile_provider
                            .profile_my_details?.user.profilePictureUrl !=
                        null
                    ? NetworkImage(
                        "${profile_provider.my_profile}",
                      )
                    : NetworkImage(
                        "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
              ),
            ),
          ),
          Spacer(),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            offset: Offset(0, 30),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Account'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Privacy'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Notifications'),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 4,
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                context.push('/account_page');
              } else if (value == 2) {
                context.push('/privacy_page');
              } else if (value == 3) {
                context.push('/notifications_page');
              } else if (value == 4) {
                context.push('/help_page_1');
              }
            },
          ),

          // IconButton(
          //     onPressed: () {
          //       PopupMenuButton(
          //         offset: Offset(0, 30), // Adjust the offset as needed
          //         itemBuilder: (BuildContext context) {
          //           return [
          //             PopupMenuItem(
          //               child: Text('Item 1'),
          //               value: 1,
          //             ),
          //             PopupMenuItem(
          //               child: Text('Item 2'),
          //               value: 2,
          //             ),
          //             // Add more items as needed
          //           ];
          //         },
          //       );

          //       // -------------------------------------------settings functionality
          //     },
          //     icon: Icon(
          //       Icons.more_vert,
          //     ))
        ],
      ),
    );
  }
}
