import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_application_1/view/public_rooms/search_bar_rooms.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home_room_body extends StatelessWidget {
  const Home_room_body({Key? key}) : super(key: key);

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
                Padding(
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
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return ExpansionTile(
                        title: Text(
                          category.name,
                          style: Text_style_constant.tab_style,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: category.chatRooms.length,
                                  itemBuilder: (context, chatIndex) {
                                    final chatRoom =
                                        category.chatRooms[chatIndex];
                                    return ListTile(
                                      tileColor: Color(0xFFF3EAFF),
                                      iconColor: Color_constant.primaryColor
                                          .withOpacity(.5),
                                      trailing: InkWell(
                                        onTap: () {
                                          context.push('/room_chat_page');
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           Room_chat_page(),
                                          //     ));
                                        },
                                        child: Icon(Icons.send,
                                            size: 20,
                                            color: Color_constant.primaryColor),
                                      ),
                                      title: Text(
                                        chatRoom.name,
                                        style: Text_style_constant.tab_style,
                                      ),
                                    );
                                  },
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: category.subcategories.length,
                                  itemBuilder: (context, childIndex) {
                                    final subcategory =
                                        category.subcategories[childIndex];
                                    return ExpansionTile(
                                      title: Text(subcategory.name,
                                          style: Text_style_constant.tab_style),
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
              ],
            );
          }
        },
      ),
    );
  }
}
