import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:flutter_application_1/view/home/home_front_body.dart';
import 'package:flutter_application_1/view/home/home_room_body.dart';
import 'package:flutter_application_1/view/profile/profile_page.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
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
      Provider.of<Profile_provider>(context, listen: false).get_details(
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
    return Scaffold(
      backgroundColor: Color_constant.secondaryColor,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Home_pageAppbar(),
            TabBar(
              tabs: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Tab(
                        text: ' Chats',
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(text: 'Rooms'),
                    ],
                  ),
                ),
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

                      Home_room_body()
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
                bool success = await Provider.of<Profile_provider>(context,
                        listen: false)
                    .get_details(
                        reference_id:
                            Provider.of<Login_provider>(context, listen: false)
                                .token,
                        id: Provider.of<Login_provider>(context, listen: false)
                            .user_id);
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
              child: Container(
                height: height * 0.15,
                width: width * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                    radius:
                        width * 0.15, // Half of the width to make it a circle
                    // backgroundImage:

                    //  NetworkImage(
                    //     Provider.of<Profile_provider>(context, listen: false)
                    //         .image),
                    child: Provider.of<Profile_provider>(context, listen: false)
                                .image !=
                            null
                        ? Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: Image.network(
                                Provider.of<Profile_provider>(context,
                                        listen: false)
                                    .image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Image.network(
                            "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png")),
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
