import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view/public_rooms/app_bar_room.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_body.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_message_bar.dart';

class Room_chat_page extends StatefulWidget {
  const Room_chat_page({super.key});

  @override
  State<Room_chat_page> createState() => _Room_chat_pageState();
}

class _Room_chat_pageState extends State<Room_chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ChatBody(),
        Positioned(top: 0, left: 0, child: App_bar_room(title: "")),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: MessageBar(
            friend_id: "",
          ),
        ),
      ]),
    );
  }
}
