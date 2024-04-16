import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:flutter_application_1/view/active_rooms/active_chats_page.dart';
import 'package:flutter_application_1/view/favourites/favourites_page.dart';
import 'package:flutter_application_1/view/home/home_front_body.dart';
import 'package:flutter_application_1/view/home/home_room_body.dart';
import 'package:flutter_application_1/view/profile/profile_page.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
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
      setState(() {
        friendsList = Provider.of<Friendship_provider>(context, listen: false)
                .friendsModel
                ?.friends ??
            [];
      });
      await Provider.of<All_users_provider>(context, listen: false).getUsers(
        token: Provider.of<Login_provider>(context, listen: false).token,
      );
      Provider.of<Friendship_provider>(context, listen: false).length =
          Provider.of<Friendship_provider>(context, listen: false)
              .friendsModel
              ?.friends
              .length;
    } catch (error) {
      print("error is $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Rooms_provider>(context, listen: false).fetch_rooms_data(
        token: Provider.of<Login_provider>(context, listen: false).token);
    // setState(() {
    Provider.of<Profile_provider>(context, listen: false).get_details(
        id: Provider.of<Login_provider>(context, listen: false).user_id,
        reference_id:
            Provider.of<Login_provider>(context, listen: false).token);
    // });

    return Scaffold(
      backgroundColor: Color_constant.secondaryColor,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Home_pageAppbar(),
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
                  icon: Icon(Icons.chat),
                  // text: 'Active chats',
                  child:
                      Text("Acive chats", style: Text_style_constant.tab_style),
                ),
                Tab(
                    icon: Icon(Icons.favorite),
                    child: Text("Favorites",
                        style: Text_style_constant.tab_style)),
              ],
            ),
            Expanded(
              child: Consumer(
                builder: (context, value, child) {
                  return TabBarView(
                    children: [
                      // Content of Tab 1
                      Home_front_body(),

                      // Content of Tab 2

                      Home_room_body(),
                      // Content of Tab 3
                      Active_chat_page(),
                      // Content of Tab 4
                      Favourites_page()
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
                bool success = await profile_provider.get_details(
                    reference_id: login_provider.token,
                    id: login_provider.user_id);
                if (success == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile_page(),
                      ));
                } else {
                  show_bottom_sheet(
                      context: context, data_to_display: "Error! Try again");
                }
              },
              child: CircleAvatar(
                backgroundImage: profile_provider.profile_picture_url != null
                    ? NetworkImage(
                        profile_provider.profile_image!,
                      )
                    : NetworkImage(
                        "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
              ),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                // -------------------------------------------settings functionality
              },
              icon: Icon(
                Icons.more_vert,
              ))
        ],
      ),
    );
  }
}
