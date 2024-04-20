import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:provider/provider.dart';

class Search_row extends StatefulWidget {
  const Search_row({super.key});

  @override
  State<Search_row> createState() => _Search_rowState();
}

class _Search_rowState extends State<Search_row> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingSearchBar(
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          openAxisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            Provider.of<All_users_provider>(context, listen: false)
                .searchUsers(searchTerm: query);
          },
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.place),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Consumer<All_users_provider>(
                  builder: (context, provider, child) {
                    if (provider.usersModel != null) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: provider.usersModel!.users.length,
                        itemBuilder: (context, index) {
                          final user = provider.usersModel!.users[index];
                          return ListTile(
                            title: Text(user.userName),
                            // Add your onTap logic here if needed
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),

        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: .5,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Color(0xFFF3EAFF),
                borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.sizeOf(context).height * .07,
            width: MediaQuery.sizeOf(context).width * .15,
            child: SvgPicture.asset("assets/fav_chats.svg")),

        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: .5,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ], color: Color(0xFFF3EAFF), borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.sizeOf(context).height * .07,
          width: MediaQuery.sizeOf(context).width * .15,
          child: Row(
            children: [Center(child: Icon(Icons.swap_vert))],
          ),
        )
        // --------------------------------------
      ],
    );
  }
}
