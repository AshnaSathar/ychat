import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/favourite_rooms_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Search_bar_rooms extends StatefulWidget {
  const Search_bar_rooms({super.key});

  @override
  State<Search_bar_rooms> createState() => _Search_bar_roomsState();
}

class _Search_bar_roomsState extends State<Search_bar_rooms> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search_controller = TextEditingController();
    bool show_fav =
        Provider.of<Favourite_rooms_provider>(context, listen: false).show_fav;
    return Row(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .07,
          width: MediaQuery.sizeOf(context).width * .75,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                Provider.of<Favourite_rooms_provider>(context, listen: false)
                    .toggle_fav_button(value: show_fav);
              });

              print("-----------------------------------_____$show_fav");
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
                  color: show_fav
                      ? Color_constant.primaryColor
                      : Color.fromARGB(231, 243, 234, 255),
                  borderRadius: BorderRadius.circular(5)),
              height: MediaQuery.sizeOf(context).height * .06,
              width: MediaQuery.sizeOf(context).width * .15,
              child: SvgPicture.asset(
                "assets/fav_chats.svg",
                color: show_fav ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
