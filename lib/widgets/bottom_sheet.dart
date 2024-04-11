import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';

Future show_bottom_sheet({required context, required data_to_display}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 100,
        width: double.infinity,
        child: Center(
          child: Text(data_to_display, style: Text_style_constant.H4_purple),
        ),
      );
    },
  );
}
