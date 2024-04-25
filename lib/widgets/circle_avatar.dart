/********************** custom widget-circle avatar**************/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';

Widget circle_avatar({required content, required context}) {
  return CircleAvatar(
    radius: 75,
    backgroundColor: Color_constant.secondaryColor,
    child: Center(
      child: Container(
        width: 83,
        child: Image.asset(
          "$content",
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
