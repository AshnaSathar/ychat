import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/favourite_rooms_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class H2 extends StatefulWidget {
  const H2({super.key});

  @override
  State<H2> createState() => _H2State();
}

class _H2State extends State<H2> {
  @override
  void initState() {
    GetData();
  }

  GetData() async {
    await Provider.of<Favourite_rooms_provider>(context, listen: false)
        .get_list(
            token: Provider.of<Login_provider>(context, listen: false).token,
            user_id:
                Provider.of<Login_provider>(context, listen: false).user_id);
  }

  TextEditingController search_controller = TextEditingController();

  Widget build(BuildContext context) {
    var categories =
        Provider.of<Rooms_provider>(context, listen: false).categories;
    bool show_fav =
        Provider.of<Favourite_rooms_provider>(context, listen: false).show_fav;

    return Column(
      children: [
        Row(
          children: [
            Container(
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
              height: MediaQuery.sizeOf(context).height * .08,
              width: MediaQuery.sizeOf(context).width * .8,
              child: TextField(
                style: Text_style_constant.H4_purple,
                onChanged: (value) {
                  Provider.of<Rooms_provider>(context, listen: false)
                      .searchRooms(searchTerm: search_controller.text);
                  setState(() {});
                },
                controller: search_controller,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Provider.of<Favourite_rooms_provider>(context,
                            listen: false)
                        .toggle_fav_button(value: show_fav);
                  });
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * .08,
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
                      color: show_fav
                          ? Color_constant.primaryColor
                          : Color.fromARGB(231, 243, 234, 255),
                      borderRadius: BorderRadius.circular(5)),
                  // height: MediaQuery.sizeOf(context).height * .06,
                  width: MediaQuery.sizeOf(context).width * .15,
                  child: SvgPicture.asset(
                    "assets/fav_chats.svg",
                    color: show_fav ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        search_controller.text.isEmpty
            ? Expanded(
                child: Column(
                  children: [
                    show_fav
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
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
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
                                            iconColor: Color_constant
                                                .primaryColor
                                                .withOpacity(.5),
                                            trailing: InkWell(
                                              onTap: () {
                                                context.push('/room_chat_page');
                                              },
                                              child: Icon(
                                                Icons.send,
                                                size: 20,
                                                color:
                                                    Color_constant.primaryColor,
                                              ),
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
                                              style: Text_style_constant
                                                  .tab_style),
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
                    )
                  ],
                ),
              )

            // ------------full list
            : Consumer<Rooms_provider>(
                builder: (context, value, child) => Expanded(
                  child: ListView.builder(
                    itemCount:
                        Provider.of<Rooms_provider>(context, listen: false)
                                .filtered_rooms
                                ?.length ??
                            0,
                    itemBuilder: (context, index) {
                      // Get the current category
                      final category =
                          Provider.of<Rooms_provider>(context, listen: false)
                              .filtered_rooms![index];
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
                                        iconColor: Color_constant.primaryColor
                                            .withOpacity(.5),
                                        trailing: InkWell(
                                          onTap: () {
                                            context.push('/room_chat_page');
                                          },
                                          child: Icon(
                                            Icons.send,
                                            size: 20,
                                            color: Color_constant.primaryColor,
                                          ),
                                        ),
                                        title: Text(
                                          chatRoom.name,
                                          style: Text_style_constant.tab_style,
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
                                          style: Text_style_constant.tab_style),
                                      children: [],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemCount: category.subcategories.length,
                          //   itemBuilder: (context, subIndex) {
                          //     final subcategory =
                          //         category.subcategories[subIndex];
                          //     return ListTile(
                          //       title: Text(subcategory.name),
                          //       // onTap: () {
                          //       //   // Handle subcategory tap
                          //       // },
                          //     );
                          //   },
                          // ),
                          // You can also add a ListView.builder for rooms here if needed
                        ],
                      );
                    },
                  ),
                ),
              )

        // -------------search result
      ],
    );
  }
}
