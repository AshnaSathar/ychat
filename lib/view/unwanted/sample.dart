  // Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 8, bottom: 8, right: 0, top: 8),
  //                     child: Container(
  //                         decoration: BoxDecoration(
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.grey.withOpacity(0.3),
  //                                 spreadRadius: .5,
  //                                 blurRadius: 1,
  //                                 offset: Offset(0, 2),
  //                               ),
  //                             ],
  //                             color: Color(0xFFF3EAFF),
  //                             borderRadius: BorderRadius.circular(15)),
  //                         height: MediaQuery.sizeOf(context).height * .07,
  //                         width: MediaQuery.sizeOf(context).width * .15,
  //                         child: SvgPicture.asset("assets/fav_chats.svg")),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(
  //                         top: 8, right: 8, left: 8, bottom: 8),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.grey.withOpacity(0.3),
  //                               spreadRadius: .5,
  //                               blurRadius: 1,
  //                               offset: Offset(0, 2),
  //                             ),
  //                           ],
  //                           color: Color(0xFFF3EAFF),
  //                           borderRadius: BorderRadius.circular(15)),
  //                       height: MediaQuery.sizeOf(context).height * .07,
  //                       width: MediaQuery.sizeOf(context).width * .15,
  //                       child: Row(
  //                         children: [Center(child: Icon(Icons.swap_vert))],
  //                       ),
  //                     ),
  //                   )
  //                   // --------------------------------------

  //                     Expanded(
  //                     child: ListView.builder(
  //                       itemCount:
  //                           friendshipProvider.friendsModel?.friends.length ??
  //                               0,
  //                       itemBuilder: (context, index) {
  //                         var profilePic = friendshipProvider
  //                             .friendsModel?.friends[index].profilePicture;
  //                         var image;
  //                         if (profilePic != null) {
  //                           image = "http://localhost:8000/storage/$profilePic";
  //                         } else {
  //                           image =
  //                               "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
  //                         }

  //                         return Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: InkWell(
  //                             onTap: () async {
  //                               bool success =
  //                                   await profileProvider.get_details(
  //                                 id: friendshipProvider
  //                                     .friendsModel?.friends[index].id,
  //                                 reference_id: loginProvider.token,
  //                               );
  //                               if (success) {
  //                                 Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                     builder: (context) => Chat_Page(
  //                                       name: friendshipProvider.friendsModel
  //                                           ?.friends[index].userName,
  //                                       id: friendshipProvider
  //                                           .friendsModel?.friends[index].id,
  //                                     ),
  //                                   ),
  //                                 );
  //                               }
  //                             },
  //                             child: ListTile(
  //                               title: Padding(
  //                                 padding: const EdgeInsets.all(8.0),
  //                                 child: Text(
  //                                   "${friendshipProvider.friendsModel?.friends[index].userName}",
  //                                   style: TextStyle(
  //                                     color: Color_constant.name_color,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               trailing: Icon(
  //                                 Icons.circle,
  //                                 size: 10,
  //                               ),
  //                               leading: CircleAvatar(
  //                                 radius: 25,
  //                                 backgroundImage: NetworkImage("$image"),
  //                               ),
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                   SearchbarCustom(),