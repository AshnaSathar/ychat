import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/public_rooms/search_bar_rooms.dart';

class Active_chat_page extends StatefulWidget {
  const Active_chat_page({super.key});

  @override
  State<Active_chat_page> createState() => _Active_chat_pageState();
}

class _Active_chat_pageState extends State<Active_chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Search_bar_rooms(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")),
                    title: Text("room name"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
