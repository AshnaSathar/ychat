import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
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
    print("rebuild ");
    friendship_provider.get_friends(
        user_id: login_provider.user_id, token: login_provider.token);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_constant.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Text("Your friend list includes"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                print(index);
                return ListTile(
                  title: Text(
                      "${friendship_provider.friendsModel?.friends[index].name}"),
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
