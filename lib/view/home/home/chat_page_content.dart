import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/view/chat_page/personalChatPage.dart';
import 'package:provider/provider.dart';

class Chat_page_content extends StatefulWidget {
  const Chat_page_content({super.key});

  @override
  State<Chat_page_content> createState() => _Chat_page_contentState();
}

class _Chat_page_contentState extends State<Chat_page_content> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Provider.of<Friendship_provider>(context, listen: false)
                .friendsModel
                ?.friends
                .length ??
            0,
        itemBuilder: (context, index) {
          var profilePic =
              Provider.of<Friendship_provider>(context, listen: false)
                  .friendsModel
                  ?.friends[index]
                  .profilePicture;
          var image;
          if (profilePic != null) {
            image = "http://localhost:8000/storage/$profilePic";
          } else {
            image =
                "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                bool success =
                    await Provider.of<Profile_provider>(context, listen: false)
                        .get_details(
                  id: Provider.of<Friendship_provider>(context, listen: false)
                      .friendsModel
                      ?.friends[index]
                      .id,
                  reference_id:
                      Provider.of<Login_provider>(context, listen: false).token,
                );
                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chat_Page(
                        name: Provider.of<Friendship_provider>(context,
                                listen: false)
                            .friendsModel
                            ?.friends[index]
                            .userName,
                        id: Provider.of<Friendship_provider>(context,
                                listen: false)
                            .friendsModel
                            ?.friends[index]
                            .id,
                      ),
                    ),
                  );
                }
              },
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${Provider.of<Friendship_provider>(context, listen: false).friendsModel?.friends[index].userName}",
                    style: TextStyle(
                      color: Color_constant.name_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.circle,
                  size: 10,
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("$image"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
