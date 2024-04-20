import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/view/chat_page/personalChatPage.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class H1 extends StatefulWidget {
  const H1({super.key});

  @override
  State<H1> createState() => _H1State();
}

class _H1State extends State<H1> {
  TextEditingController search_controller = TextEditingController();
  bool is_search = false;
  bool show_fav = false;
  @override
  Widget build(BuildContext context) {
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    Provider.of<Friendship_provider>(context, listen: false).get_friends(
        token: Provider.of<Login_provider>(context, listen: false).token,
        user_id: Provider.of<Login_provider>(context, listen: false).user_id);
    return Column(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: MediaQuery.sizeOf(context).height * .08,
              width: MediaQuery.sizeOf(context).width * .6,
              decoration: BoxDecoration(
                  color: Color_constant.secondaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: TextField(
                onChanged: (value) {
                  Provider.of<All_users_provider>(context, listen: false)
                      .searchUsers(searchTerm: search_controller.text);
                  setState(() {});
                },
                controller: search_controller,
                style: TextStyle(),
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color_constant.name_color,
                      fontFamily: GoogleFonts.inder().fontFamily),
                  suffixIcon: search_controller.text.isEmpty
                      ? Icon(
                          Icons.search,
                          color: Color_constant.name_color,
                          size: 20,
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              search_controller.clear();
                            });
                          },
                          child: Icon(Icons.close)),
                  filled: true,
                  fillColor: Color_constant.secondaryColor,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
            child: InkWell(
              onDoubleTap: () {
                setState(() {
                  show_fav = false;
                });
              },
              onTap: () {
                setState(() {
                  show_fav = !show_fav;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          spreadRadius: .5,
                          blurRadius: 1,
                          offset: Offset(0, 3)),
                      BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          spreadRadius: .5,
                          blurRadius: 1,
                          offset: Offset(2, 2))
                    ],
                    color: Color.fromARGB(231, 243, 234, 255),
                    borderRadius: BorderRadius.circular(5)),
                height: MediaQuery.sizeOf(context).height * .08,
                width: MediaQuery.sizeOf(context).width * .15,
                child: show_fav
                    ? Icon(Icons.person_2)
                    : SvgPicture.asset("assets/fav_chats.svg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(0, 2)),
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(2, 2))
                  ],
                  color: Color.fromARGB(231, 243, 234, 255),
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.swap_vert),
              height: MediaQuery.sizeOf(context).height * .08,
              width: MediaQuery.sizeOf(context).width * .15,
            ),
          )
        ],
      ),
      search_controller.text.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Search Results",
                        style: Text_style_constant.H4_purple,
                      ),
                    ],
                  ),
                ),
                Consumer<All_users_provider>(
                  builder: (context, provider, child) {
                    if (search_controller.text.isNotEmpty &&
                        provider.usersModel != null) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.sizeOf(context).height * .3,
                        child: ListView.builder(
                          itemCount: provider.usersModel!.users.length,
                          itemBuilder: (context, index) {
                            final user = provider.usersModel!.users[index];
                            return ListTile(
                              trailing: IconButton(
                                onPressed: () async {
                                  // print("user.id is");
                                  // print(user.id);
                                  bool success =
                                      await Provider.of<Friendship_provider>(
                                              context,
                                              listen: false)
                                          .add_friend(
                                              user_id:
                                                  Provider.of<Login_provider>(
                                                          context,
                                                          listen: false)
                                                      .user_id,
                                              token:
                                                  Provider.of<Login_provider>(
                                                          context,
                                                          listen: false)
                                                      .token,
                                              friend_uid: user.id);
                                  if (success == true) {
                                    show_bottom_sheet(
                                        context: context,
                                        data_to_display:
                                            "Added to your friend list");

                                    setState(() {
                                      Provider.of<Friendship_provider>(context,
                                              listen: false)
                                          .get_friends(
                                              user_id:
                                                  Provider.of<Login_provider>(
                                                          context,
                                                          listen: false)
                                                      .user_id,
                                              token:
                                                  Provider.of<Login_provider>(
                                                          context,
                                                          listen: false)
                                                      .token);
                                    });
                                  } else {
                                    show_bottom_sheet(
                                        context: context,
                                        data_to_display:
                                            "Failed to add. Try again later");
                                  }
                                },
                                icon: Icon(Icons.add),
                              ),
                              title: InkWell(
                                  onTap: () async {
                                    bool success =
                                        await Provider.of<Profile_provider>(
                                                context,
                                                listen: false)
                                            .get_details(
                                                id: user.id,
                                                reference_id:
                                                    Provider.of<Login_provider>(
                                                            context,
                                                            listen: false)
                                                        .token);
                                    if (success) {
                                      context.push('/friend_profile_page');
                                      // Navigator.pushNamed(
                                      //     context, '/friend_profile_page');
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           Friend_profile_page(),
                                      //     ));
                                    }
                                  },
                                  child: Text(user.userName)),
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            )
          : show_fav
              ? Column(
                  children: [
                    Text(
                      "Close Friends",
                      style: Text_style_constant.H4_purple,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                  ],
                )
              : Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "My Friends",
                              style: Text_style_constant.H4_purple,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              friendship_provider.friendsModel?.friends.length,
                          itemBuilder: (context, index) {
                            var profile_pic = friendship_provider
                                .friendsModel?.friends[index].profilePicture;
                            var image;
                            if (profile_pic != null) {
                              image =
                                  "http://localhost:8000/storage/$profile_pic";
                            } else {
                              image =
                                  "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
                            }

                            return InkWell(
                              onTap: () async {
                                //
                                bool success =
                                    await profile_provider.get_details(
                                        id: friendship_provider
                                            .friendsModel?.friends[index].id,
                                        reference_id: login_provider.token);
                                if (success) {
                                  // ------------router
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Chat_Page(
                                            name: friendship_provider
                                                .friendsModel
                                                ?.friends[index]
                                                .userName,
                                            id: friendship_provider.friendsModel
                                                ?.friends[index].id),
                                      ));
                                }
                              },
                              child: ListTile(
                                title: Text(
                                  "${friendship_provider.friendsModel?.friends[index].userName}",
                                  style: TextStyle(
                                      color: Color_constant.name_color,
                                      fontFamily:
                                          GoogleFonts.inder().fontFamily,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("hey. how are you"),
                                trailing: Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                leading: CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage("${image}"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
    ]);
  }
}
