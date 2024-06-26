/***********************widget- searchbar*******************/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchbarCustom extends StatefulWidget {
  const SearchbarCustom({super.key});

  @override
  State<SearchbarCustom> createState() => _SearchbarCustomState();
}

class _SearchbarCustomState extends State<SearchbarCustom> {
  @override
  Widget build(BuildContext context) {
    var friendship_provider =
        Provider.of<Friendship_provider>(context, listen: false);
    var profile = Provider.of<Profile_provider>(context, listen: false);
    var all_user = Provider.of<All_users_provider>(context, listen: false);
    TextEditingController search_controller = TextEditingController();
    return Container(
      width: MediaQuery.sizeOf(context).width * .59,
      decoration: BoxDecoration(
        color: Color_constant.secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Expanded(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                all_user.searchUsers(searchTerm: search_controller.text);
              },
              controller: search_controller,
              style: TextStyle(),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Color_constant.name_color,
                  size: 20,
                ),
                filled: true,
                fillColor: Color_constant.secondaryColor,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Consumer<All_users_provider>(
              builder: (context, provider, child) {
                if (search_controller.text.isNotEmpty &&
                    provider.usersModel != null) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    height: MediaQuery.sizeOf(context).height * .3,
                    child: ListView.builder(
                      itemCount: provider.usersModel!.users.length,
                      itemBuilder: (context, index) {
                        final user = provider.usersModel!.users[index];
                        return ListTile(
                          trailing: IconButton(
                            onPressed: () async {
                              // print("user.id is");
                              // print(user.id);
                              bool success =
                                  await friendship_provider.add_friend(
                                      user_id: Provider.of<Login_provider>(
                                              context,
                                              listen: false)
                                          .user_id,
                                      token: Provider.of<Login_provider>(
                                              context,
                                              listen: false)
                                          .token,
                                      friend_uid: user.id);
                              if (success == true) {
                                show_bottom_sheet(
                                    context: context,
                                    data_to_display:
                                        "Added to your friend list");

                                setState(() {
                                  friendship_provider.get_friends(
                                      user_id: Provider.of<Login_provider>(
                                              context,
                                              listen: false)
                                          .user_id,
                                      token: Provider.of<Login_provider>(
                                              context,
                                              listen: false)
                                          .token);
                                });
                              } else {
                                show_bottom_sheet(
                                    context: context,
                                    data_to_display:
                                        "Failed to add. Try again later");
                              }
                            },
                            icon: Icon(Icons.add),
                          ),
                          title: InkWell(
                              onTap: () async {
                                bool success = await profile.get_details(
                                    id: user.id,
                                    reference_id: Provider.of<Login_provider>(
                                            context,
                                            listen: false)
                                        .token);
                                if (success) {
                                  context.push('/friend_profile_page');
                                  // Navigator.pushNamed(
                                  //     context, '/friend_profile_page');
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           Friend_profile_page(),
                                  //     ));
                                }
                              },
                              child: Text(user.userName!)),
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
