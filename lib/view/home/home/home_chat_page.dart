import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view/home/home/chat_page_content.dart';
import 'package:flutter_application_1/view/home/home/search_row.dart';

class Home_chat_page extends StatefulWidget {
  const Home_chat_page({super.key});

  @override
  State<Home_chat_page> createState() => _Home_chat_pageState();
}

class _Home_chat_pageState extends State<Home_chat_page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search_row(),
        Chat_page_content(),
        //
      ],
    );
  }
}
