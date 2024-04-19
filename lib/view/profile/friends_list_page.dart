import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Friends_list_page extends StatefulWidget {
  const Friends_list_page({super.key});

  @override
  State<Friends_list_page> createState() => _Friends_list_pageState();
}

class _Friends_list_pageState extends State<Friends_list_page> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {} catch (error) {
      print("error is $error");
    }
  }

  Widget build(BuildContext context) {
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    friendship_provider.get_friends(
        user_id: login_provider.user_id, token: login_provider.token);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_constant.primaryColor,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Friend List",
                  style: Text_style_constant.H4_purple,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
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
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(image)),
                  title: InkWell(
                    onTap: () async {
                      bool success = await Provider.of<Profile_provider>(
                              context,
                              listen: false)
                          .get_details(
                              id: friendship_provider
                                  .friendsModel?.friends[index].id,
                              reference_id: Provider.of<Login_provider>(context,
                                      listen: false)
                                  .token);
                      if (success) {
                        // Navigator.pushNamed(context, '/friend_profile_page');
                        context.push('/friend_profile_page');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Friend_profile_page(),
                        //     ));
                      }
                    },
                    child: Text(
                      "${friendship_provider.friendsModel?.friends[index].userName}",
                      style: Text_style_constant.normal_text,
                    ),
                  ),
                  trailing: InkWell(
                      onTap: () async {
                        bool success = await friendship_provider.remove_friend(
                            friend_id: friendship_provider
                                .friendsModel?.friends[index].id,
                            token: login_provider.token,
                            user_id: login_provider.user_id);
                        if (success) {
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.remove)),
                );
              },
              itemCount: friendship_provider.friendsModel?.friends.length,
            ),
          )
        ],
      ),
    );
  }
}
