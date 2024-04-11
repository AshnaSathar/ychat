import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:provider/provider.dart';

Widget Email_text_field({required context}) {
  return TextField(
    controller:
        Provider.of<email_provider>(context, listen: false).email_controller,
    decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color_constant.secondaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "email",
        labelText: "email",
        labelStyle: Text_style_constant.H4_white,
        hintStyle: Text_style_constant.H4_white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color_constant.secondaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color_constant.secondaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color_constant.secondaryColor))),
  );
}

class email_provider extends ChangeNotifier {
  TextEditingController email_controller = TextEditingController();
  bool is_email_id = false;
}
