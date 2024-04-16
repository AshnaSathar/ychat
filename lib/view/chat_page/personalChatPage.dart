import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_body.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_app_bar.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_message_bar.dart';
import 'package:provider/provider.dart';

class Chat_Page extends StatefulWidget {
  final id;
  final name;
  const Chat_Page({Key? key, required this.id, required this.name});

  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ChatBody(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Builder(
              builder: (BuildContext builderContext) {
                return AppbarContainer(
                    title:
                        "${Provider.of<Profile_provider>(context, listen: false).userName}");
              },
            ),
          ),

          // Provider.of<ProviderClass>(context, listen: false).isActive
          //     ? MessageContainer(msg: "hey")
          //     : SizedBox(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MessageBar(
              friend_id:
                  Provider.of<Profile_provider>(context, listen: false).user_id,
            ),
          ),
        ],
      ),
    );
  }
}
