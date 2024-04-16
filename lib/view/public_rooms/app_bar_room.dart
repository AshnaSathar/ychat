import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/view/profile/friend_profile_page.dart';
import 'package:provider/provider.dart';

class App_bar_room extends StatelessWidget {
  final String title;
  const App_bar_room({Key? key, required this.title}) : super(key: key);
  Widget build(BuildContext context) {
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);

    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Color_constant.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Color_constant.secondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Room Name",
              style: Text_style_constant.H3_white,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 15,
              child: Icon(
                Icons.groups_2,
                size: 20,
                color: Color_constant.secondaryColor,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.notifications_outlined)),
          )
        ],
      ),
    );
  }
}
