import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';

Widget Button({required text, required context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color_constant.secondaryColor,
    ),
    height: MediaQuery.sizeOf(context).height * .07,
    width: MediaQuery.sizeOf(context).width * .4,
    child: Center(
      child: Text(
        text,
        style: Text_style_constant.H2,
      ),
    ),
  );
}
