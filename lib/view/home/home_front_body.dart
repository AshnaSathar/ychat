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
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
            child: SearchbarCustom(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friendship_provider.friendsModel?.friends.length,
              itemBuilder: (context, index) {
                var profile_pic = friendship_provider
                    .friendsModel?.friends[index].profilePicture;
                var image;
                if (profile_pic != null) {
                  image = "http://localhost:8000/storage/$profile_pic";
                } else {
                  image =
                      "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      //
                      bool success = await profile_provider.get_details(
                          id: friendship_provider
                              .friendsModel?.friends[index].id,
                          reference_id: login_provider.token);
                      if (success) {
                        // ------------router
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat_Page(
                                  name: friendship_provider
                                      .friendsModel?.friends[index].userName,
                                  id: friendship_provider
                                      .friendsModel?.friends[index].id),
                            ));
                      }
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${friendship_provider.friendsModel?.friends[index].userName}",
                          style: TextStyle(
                              color: Color_constant.name_color,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Icon(
                        Icons.circle,
                        size: 10,
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
