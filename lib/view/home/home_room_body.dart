import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/favourite_rooms_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_application_1/view/public_rooms/search_bar_rooms.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home_room_body extends StatefulWidget {
  const Home_room_body({Key? key}) : super(key: key);

  @override
  State<Home_room_body> createState() => _Home_room_bodyState();
}

class _Home_room_bodyState extends State<Home_room_body> {
  void initState() {
    GetData();
  }

  GetData() async {
    await Provider.of<Favourite_rooms_provider>(context, listen: false)
        .get_list(
            user_id:
                Provider.of<Login_provider>(context, listen: false).user_id,
            token: Provider.of<Login_provider>(context, listen: false).token);
  }

  @override
  Widget build(BuildContext context) {
    var categories =
        Provider.of<Rooms_provider>(context, listen: false).categories;

    return Scaffold(
      body: Consumer<Rooms_provider>(
        builder: (context, value, child) {
          if (Provider.of<Rooms_provider>(context, listen: false)
              .categories
              .isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Search_bar_rooms(),
                ),
                Consumer<Favourite_rooms_provider>(
                  builder: (context, value, child) =>
                      Provider.of<Favourite_rooms_provider>(context,
                                  listen: false)
                              .show_fav
                          ? ExpansionTile(
                              title: Text(
                                "Favourite rooms",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontFamily: GoogleFonts.inter().fontFamily),
                              ),
                              children: [
                                Container(
                                  color: Color_constant.secondaryColor,
                                  // height: MediaQuery.sizeOf(context).height * .3,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        Provider.of<Favourite_rooms_provider>(
                                                context,
                                                listen: false)
                                            .rooms_fav
                                            .length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        // tileColor: Color(0xFFF3EAFF),
                                        trailing: InkWell(
                                          onTap: () {
                                            context.push('/room_chat_page');
                                          },
                                          child: Icon(
                                            Icons.send,
                                            color: Color_constant.primaryColor,
                                          ),
                                        ),
                                        title: Text(
                                          "${Provider.of<Favourite_rooms_provider>(context, listen: false).rooms_fav[index].name}",
                                          style: Text_style_constant.tab_style,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Categories",
                                    style: Text_style_constant.H4_purple,
                                  ),
                                ],
                              ),
                            ),
                ),
                Expanded(
                  child: Container(
                    color: Color_constant.secondaryColor,
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ExpansionTile(
                          title: Text(
                            category.name,
                            style: Text_style_constant.tab_style_bold,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: category.chatRooms.length,
                                    itemBuilder: (context, chatIndex) {
                                      final chatRoom =
                                          category.chatRooms[chatIndex];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          // tileColor: Color(0xFFF3EAFF),
                                          iconColor: Color_constant.primaryColor
                                              .withOpacity(.5),
                                          trailing: InkWell(
                                            onTap: () {
                                              context.push('/room_chat_page');
                                            },
                                            child: Icon(Icons.send,
                                                size: 20,
                                                color: Color_constant
                                                    .primaryColor),
                                          ),
                                          title: Text(
                                            chatRoom.name,
                                            style:
                                                Text_style_constant.tab_style,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: category.subcategories.length,
                                    itemBuilder: (context, childIndex) {
                                      final subcategory =
                                          category.subcategories[childIndex];
                                      return ExpansionTile(
                                        title: Text(subcategory.name,
                                            style:
                                                Text_style_constant.tab_style),
                                        children: [],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
