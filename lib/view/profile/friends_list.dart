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
    print("rebuild ");
    Provider.of<Friendship_provider>(context, listen: false).get_friends(
        user_id: Provider.of<Login_provider>(context, listen: false).user_id,
        token: Provider.of<Login_provider>(context, listen: false).token);
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
                      "${Provider.of<Friendship_provider>(context, listen: false).friendsModel?.friends[index].name}"),
                  trailing: InkWell(
                      onTap: () async {
                        bool success = await Provider.of<Friendship_provider>(
                                context,
                                listen: false)
                            .remove_friend(
                                friend_id: Provider.of<Friendship_provider>(
                                        context,
                                        listen: false)
                                    .friendsModel
                                    ?.friends[index]
                                    .id,
                                token: Provider.of<Login_provider>(context,
                                        listen: false)
                                    .token,
                                user_id: Provider.of<Login_provider>(context,
                                        listen: false)
                                    .user_id);
                        if (success) {
                          print("refreshing");
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.remove)),
                );
              },
              itemCount:
                  Provider.of<Friendship_provider>(context, listen: false)
                      .friendsModel
                      ?.friends
                      .length,
            ),
          )
        ],
      ),
    );
  }
}
