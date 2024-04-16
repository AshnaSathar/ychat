import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatMessage {
  final String senderId;
  final String message;
  final String receiverId;
  final DateTime timestamp;
  final String status;

  ChatMessage({
    required this.senderId,
    required this.message,
    required this.receiverId,
    required this.timestamp,
    required this.status,
  });
}

class ChatBody extends StatefulWidget {
  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  late IO.Socket socket;
  List<ChatMessage> messages = [];
  bool isSavedToDb = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    socket = IO.io("http://localhost:3000/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true
    });
    socket.onConnect((_) {
      socket.emit('connection');
    });
    socket.emit('storeSocket',
        {'uid': Provider.of<Login_provider>(context, listen: false).user_id});

    socket.on('messages', (data) {
      print('Received message data: $data');
      setState(() {
        String rid = data['rid'];
        var msg = data['msg'];
        var sid = data['sid'];

        print('Received message: $msg from $sid to $rid');

        ChatMessage chatMessage = ChatMessage(
          senderId: sid,
          message: msg,
          receiverId: rid,
          timestamp: DateTime.now(),
          status: 'delivered',
        );

        messages.add(chatMessage);
      });
    });
  }

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
}
