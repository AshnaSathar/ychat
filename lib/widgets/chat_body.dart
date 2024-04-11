import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var sendmsg = provider.sendmessage.cast<String>();
    // print("Send Messages: $sendmsg");

    return Stack(
      children: [
        GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              child: Image.asset("assets/background_Image.jpg"),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          // top: 0,
          top: MediaQuery.sizeOf(context).height * .1,
          child: Container(
            color: Color.fromARGB(212, 238, 227, 251),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: ListView.separated(
              //   itemCount: ,
              //   itemBuilder: (context, index) {},
              //   separatorBuilder: (context, index) {
              //     return SizedBox();
              //   },
              // ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget buildChatListView(List<String> allMessages) {
  //   var provider = Provider.of<ProviderClass>(context, listen: true);
  //   var sendmsg = provider.sendmessage.cast<String>();
  //   print("Send Messages: $sendmsg");
  //   return
  // }
}
