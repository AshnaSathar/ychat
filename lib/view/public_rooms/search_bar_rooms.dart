import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';

class Search_bar_rooms extends StatefulWidget {
  const Search_bar_rooms({super.key});

  @override
  State<Search_bar_rooms> createState() => _Search_bar_roomsState();
}

class _Search_bar_roomsState extends State<Search_bar_rooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .07,
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
              hintText: "Type here",
              hintStyle: Text_style_constant.normal_text),
        ),
      ),
    );
  }
}
