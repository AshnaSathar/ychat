import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/image_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:flutter_application_1/view/profile/edit_profile_page.dart';
import 'package:flutter_application_1/view/profile/friends_list.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  late List<Friend> friendsList;
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      await Provider.of<Friendship_provider>(context, listen: false)
          .get_friends(
        user_id: Provider.of<Login_provider>(context, listen: false).user_id,
        token: Provider.of<Login_provider>(context, listen: false).token,
      );
      setState(() {
        friendsList = Provider.of<Friendship_provider>(context, listen: false)
                .friendsModel
                ?.friends ??
            [];
      });
    } catch (error) {
      print("error is $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var file_provider = Provider.of<File_provider>(context, listen: false);
    var profile_provider =
        Provider.of<Profile_provider>(context, listen: false);
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var login_provider = Provider.of<Login_provider>(context, listen: false);
    friendsList =
        Provider.of<Friendship_provider>(context).friendsModel?.friends ?? [];

    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Color_constant.primaryColor,
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color_constant.primaryColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Color_constant.primaryColor,
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                  ),
                ),
                child: profile_provider.cover_imageUrl != null
                    ? Image.network(
                        "${profile_provider.cover_image}",
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        "https://images.pexels.com/photos/7130560/pexels-photo-7130560.jpeg?cs=srgb&dl=pexels-codioful-%28formerly-gradienta%29-7130560.jpg&fm=jpg",
                        fit: BoxFit.fill,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 239, 187, 248),
                      radius: 15,
                      child: Icon(Icons.settings_outlined, color: Colors.black),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () async {
                          //image picker
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            print('Image path: ${image.path}');
                            bool success = await Provider.of<File_provider>(
                                    context,
                                    listen: false)
                                .upload_cover_images(
                                    userId: login_provider.user_id,
                                    token: login_provider.token,
                                    imagePath: image.path);
                            setState(() {
                              profile_provider.get_details(
                                  id: login_provider.user_id,
                                  reference_id: login_provider.token);
                            });
                            if (success) {
                            } else {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display: "Try again later");
                            }
                          }
                        },
                        child: Icon(Icons.edit))
                  ],
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2.75,
                bottom: 40,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color_constant.secondaryColor,
                          width: MediaQuery.of(context).size.width * .015,
                        ),
                      ),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 55,
                            backgroundImage: profile_provider.imageUrl != null
                                ? NetworkImage(
                                    profile_provider.image!,
                                  )
                                : NetworkImage(
                                    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  final XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    print('Image path: ${image.path}');
                                    bool success = await file_provider
                                        .upload_profile_picture(
                                            userId: login_provider.user_id,
                                            imagePath: image.path,
                                            token: login_provider.token);
                                    setState(() {
                                      profile_provider.get_details(
                                          id: login_provider.user_id,
                                          reference_id: login_provider.token);
                                    });
                                    if (success) {
                                    } else {
                                      show_bottom_sheet(
                                          context: context,
                                          data_to_display: "Try again later");
                                    }
                                  } else {
                                    print('No image selected.');
                                  }
                                },
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                    color: Color_constant.primaryColor,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "${profile_provider.userName}",
            style: Text_style_constant.H2_white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  bool success = await friendship_provider.get_friends(
                    user_id: login_provider.user_id,
                    token: login_provider.token,
                  );
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Friends_list_page(),
                      ),
                    );
                  }
                },
                child: Text(
                  "${friendsList.length} Friends",
                  style: Text_style_constant.H4_white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit_profile_page(),
                      ));
                },
                child: Button(text: "Edit Availability", context: context)),
          )
        ],
      ),
    );
  }
}
