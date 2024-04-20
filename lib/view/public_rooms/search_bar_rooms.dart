import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search_bar_rooms extends StatefulWidget {
  const Search_bar_rooms({super.key});

  @override
  State<Search_bar_rooms> createState() => _Search_bar_roomsState();
}

class _Search_bar_roomsState extends State<Search_bar_rooms> {
  @override
  bool show_fav = false;
  Widget build(BuildContext context) {
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
            child: TextField(
              decoration: InputDecoration(
                  suffixIconColor: Color_constant.name_color,
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  // hintText: "Type here",
                  hintStyle: Text_style_constant.normal_text),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
