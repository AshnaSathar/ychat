import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/view/chat_page/personalChatPage.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class Home_front_body extends StatefulWidget {
  const Home_front_body({super.key});

  @override
  State<Home_front_body> createState() => _Home_front_bodyState();
}

class _Home_front_bodyState extends State<Home_front_body> {
  void initstate() {
    getdata();
  }

  getdata() async {
    // await Provider.of<Friendship_provider>(context, listen: false).get_friends(
    //     user_id: Provider.of<Login_provider>(context, listen: false).user_id,
    //     token: Provider.of<Login_provider>(context, listen: false).token);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchbarCustom(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  Provider.of<Friendship_provider>(context, listen: false)
                      .friendsModel
                      ?.friends
                      .length,
              itemBuilder: (context, index) {
                var profile_pic =
                    Provider.of<Friendship_provider>(context, listen: false)
                        .friendsModel
                        ?.friends[index]
                        .profilePicture;
                var image;
                if (profile_pic != null) {
                  image = "http://localhost:8000/storage/$profile_pic";
                } else {
                  image =
                      "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
                }
                print(
                    "image is ${Provider.of<Friendship_provider>(context, listen: false).friendsModel?.friends[index].profilePicture}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      //
                      bool success = await Provider.of<Profile_provider>(
                              context,
                              listen: false)
                          .get_details(
                              id: Provider.of<Friendship_provider>(context,
                                      listen: false)
                                  .friendsModel
                                  ?.friends[index]
                                  .id,
                              reference_id: Provider.of<Login_provider>(context,
                                      listen: false)
                                  .token);
                      if (success) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat_Page(
                                  name: Provider.of<Friendship_provider>(
                                          context,
                                          listen: false)
                                      .friendsModel
                                      ?.friends[index]
                                      .userName,
                                  id: Provider.of<Friendship_provider>(context,
                                          listen: false)
                                      .friendsModel
                                      ?.friends[index]
                                      .id),
                            ));
                      }
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${Provider.of<Friendship_provider>(context, listen: false).friendsModel?.friends[index].name}",
                          style: TextStyle(
                              color: Color_constant.name_color,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.green,
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("${image}"),
                      ),
                    ),
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
