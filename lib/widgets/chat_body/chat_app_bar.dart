import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/view/friend_profile.dart';
import 'package:provider/provider.dart';

class AppbarContainer extends StatelessWidget {
  final String title;
  const AppbarContainer({Key? key, required this.title}) : super(key: key);
  Widget build(BuildContext context) {
    var image;
    var profile_picture =
        Provider.of<Profile_provider>(context, listen: false).imageUrl!;
    if (profile_picture != null) {
      image = "http://localhost:8000$profile_picture";
    } else {
      image =
          "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
    }
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
            child: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                //
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Friend_profile_page(),
                    ));
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network("$image"),
                ),
              ),
            ),
          ),
          Icon(
            Icons.circle,
            size: 15,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.video_call_sharp)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.call)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.more_vert_sharp)),
          )
        ],
      ),
    );
  }
}
