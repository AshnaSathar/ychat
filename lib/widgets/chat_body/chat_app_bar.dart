import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:provider/provider.dart';

class AppbarContainer extends StatelessWidget {
  final String title;
  const AppbarContainer({Key? key, required this.title}) : super(key: key);
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
            child: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                //
                Navigator.pushNamed(context, '/friend_profile_page');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Friend_profile_page(),
                //     ));
              },
              child: CircleAvatar(
                // maxRadius: 25,
                backgroundImage: profile_provider.profile_picture_url != null
                    ? NetworkImage(
                        profile_provider.profile_image!,
                      )
                    : NetworkImage(
                        "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png"),
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
