import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/favourites_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/model/favourites_model.dart';
import 'package:flutter_application_1/view/public_rooms/room_chat_page.dart';
import 'package:flutter_application_1/view/public_rooms/search_bar_rooms.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Favourites_page extends StatefulWidget {
  const Favourites_page({super.key});

  @override
  State<Favourites_page> createState() => _Favourites_pageState();
}

class _Favourites_pageState extends State<Favourites_page> {
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    Provider.of<Favourites_provider>(context, listen: false).get_list(
        token: Provider.of<Login_provider>(context, listen: false).token,
        user_id: Provider.of<Login_provider>(context, listen: false).user_id);
  }

  @override
  Widget build(BuildContext context) {
    List<Favorite> favourites =
        Provider.of<Favourites_provider>(context, listen: false).favourites;
    return Scaffold(
      body: Consumer<Favourites_provider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Search_bar_rooms(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    var image;
                    var profile_pic = favourites[index].profilePicture;
                    if (profile_pic != null) {
                      image = "http://localhost:8000/storage/$profile_pic";
                    } else {
                      image =
                          "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.go('/room_chat_page');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Room_chat_page(),
                          //     ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(image)),
                          title: Text("${favourites[index].userName}"),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
