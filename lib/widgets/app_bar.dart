/************************App Bar*********************/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget app_bar(
    {required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: Color_constant.primaryColor,
    title: Text(
      title,
      style: Text_style_constant.H3_white,
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_sharp,
        color: Color_constant.secondaryColor,
      ),
      onPressed: () {
        context.pop();
      },
    ),
  );
}
