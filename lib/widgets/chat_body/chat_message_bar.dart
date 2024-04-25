import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
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

class MessageBar extends StatefulWidget {
  final friend_id;
  const MessageBar({Key? key, required this.friend_id});
  @override
  State<MessageBar> createState() => _MessageBarState();
}

int? maxLines = 1;

class _MessageBarState extends State<MessageBar> {
  List<ChatMessage> sentMessages = [];
  bool _emojiShowing = false;
  TextEditingController messageController = TextEditingController();
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    socket = IO.io("http://localhost:3000/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.on('message_sent', (data) {
      sentMessages.add(ChatMessage(
        status: "sent",
        timestamp: DateTime.now(),
        message: messageController.text,
        receiverId: widget.friend_id,
        senderId: Provider.of<Login_provider>(context, listen: false).user_id,
      ));
      messageController.clear();
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.emoji_emotions,
                  color: Colors.amber,
                ),
                onPressed: () {
                  _toggleEmojiPicker();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Color_constant.name_color,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (builder) => bottomsheet(context: context),
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color_constant.textfield_color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      controller: messageController,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {});
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              buildSendButton()
            ],
          ),
        ),
        if (_emojiShowing)
          EmojiPicker(
            config: Config(
                emojiTextStyle: GoogleFonts.notoColorEmoji(),
                categoryViewConfig:
                    CategoryViewConfig(showBackspaceButton: false),
                bottomActionBarConfig: BottomActionBarConfig(
                    buttonIconColor: Colors.black,
                    buttonColor: Color_constant.secondaryColor,
                    backgroundColor: Color_constant.secondaryColor,
                    showBackspaceButton: false),
                emojiViewConfig: EmojiViewConfig(
                  columns: 9,
                ),
                searchViewConfig: SearchViewConfig(buttonColor: Colors.black)),
            onEmojiSelected: (category, emoji) {
              setState(() {
                messageController.text += emoji.emoji;
              });
            },
          ),
      ],
    );
  }

  void _toggleEmojiPicker() {
    setState(() {
      _emojiShowing = !_emojiShowing;
    });
  }

  Widget buildSendButton() {
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    return messageController.text.isEmpty
        ? InkWell(
            child: Icon(
              Icons.mic,
              color: Color_constant.name_color,
            ),
          )
        : InkWell(
            onTap: () {
              var sid = login_provider.user_id;
              var rid = widget.friend_id;
              // print("---------------");
              // print("sid is $sid");
              // print("rid is ${widget.friend_id}");
              final message = messageController.text.trim();
              if (message.isNotEmpty) {
                socket = IO.io("http://localhost:3000/", <String, dynamic>{
                  'transports': ['websocket'],
                  'autoConnect': true
                });
                socket.emit('message',
                    {'sid': sid, 'msg': messageController.text, 'rid': rid});
                ChatMessage chatMessage = ChatMessage(
                  senderId: sid.toString(),
                  message: messageController.text,
                  receiverId: rid.toString(),
                  timestamp: DateTime.now(),
                  status: "sent",
                );
                messageController.clear();
              }
            },
            child: Icon(Icons.send),
          );
  }
}
