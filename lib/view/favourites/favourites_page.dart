import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/close_friends_provider.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/model/favourites_model.dart';
import 'package:flutter_application_1/view/chat_page/personalChatPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favourites_page extends StatefulWidget {
  const Favourites_page({super.key});

  @override
  State<Favourites_page> createState() => _Favourites_pageState();
}

class _Favourites_pageState extends State<Favourites_page> {
  void initState() {
    super.initState();

    getData();
  }

  getData() async {}

  @override
  Widget build(BuildContext context) {
    // var favourite_provider =
    //     Provider.of<close_friends_provider>(context, listen: false);
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    List<Favorite> favourites =
        Provider.of<close_friends_provider>(context, listen: false).favourites;
    return Provider.of<close_friends_provider>(context, listen: false).isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<close_friends_provider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Close friends",
                          style: Text_style_constant.H4_purple.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  //   child: Search_bar_rooms(),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: favourites.length,
                      itemBuilder: (context, index) {
                        var image;
                        var profile_pic = favourites[index].profilePicture;
                        if (profile_pic != null) {
                          image = "http://localhost:8000/storage/$profile_pic";
                        } else {
                          image =
                              "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              bool success = await profile_provider.get_details(
                                  id: friendship_provider
                                      .friendsModel?.friends[index].id,
                                  reference_id: login_provider.token);
                              if (success) {
                                // ------------router
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Chat_Page(
                                          name: friendship_provider.friendsModel
                                              ?.friends[index].userName,
                                          id: friendship_provider
                                              .friendsModel?.friends[index].id),
                                    ));
                              }
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(image)),
                              title: Text(
                                "${favourites[index].userName}",
                                style: TextStyle(
                                    color: Color_constant.name_color,
                                    fontFamily: GoogleFonts.inder().fontFamily,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          );
  }
}
