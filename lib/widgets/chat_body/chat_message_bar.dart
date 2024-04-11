import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({Key? key});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

int? maxLines = 1;

class _MessageBarState extends State<MessageBar> {
  bool _emojiShowing = false;
  TextEditingController messageController = TextEditingController();

  @override
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
                        // int lines = '\n'.allMatches(text).length + 1;
                        // if (lines > 5) {
                        //   setState(() {
                        //     maxLines = lines > 5 ? 5 : lines;
                        //   });
                        // }
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
    return messageController.text.isEmpty
        ? InkWell(
            child: Icon(
              Icons.mic,
              color: Color_constant.name_color,
            ),
          )
        : InkWell(
            onTap: () {
              // Provider.of<ProviderClass>(context, listen: false).isActive =
              //     true;
              // Provider.of<ProviderClass>(context, listen: false)
              //     .addmessage(message: messageController.text);
              messageController.clear();
            },
            child: Icon(Icons.send),
          );
  }
}
