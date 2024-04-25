// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/controller/users.dart';
// import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
// import 'package:provider/provider.dart'; // Ensure you import necessary dependencies

// class Home_screen extends StatelessWidget {
//   const Home_screen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           buildFloatingSearchBar(context: context),
//         ],
//       ),
//     );
//   }

//   Widget buildFloatingSearchBar({required BuildContext context}) {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     return FloatingSearchBar(
//       hint: 'Search...',
//       scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//       transitionDuration: const Duration(milliseconds: 800),
//       transitionCurve: Curves.easeInOut,
//       physics: const BouncingScrollPhysics(),
//       axisAlignment: isPortrait ? 0.0 : -1.0,
//       openAxisAlignment: 0.0,
//       width: isPortrait ? 600 : 500,
//       debounceDelay: const Duration(milliseconds: 500),
//       onQueryChanged: (query) {
//         // Update your search query here
//         Provider.of<All_users_provider>(context, listen: false)
//             .searchUsers(searchTerm: query);
//       },
//       transition: CircularFloatingSearchBarTransition(),
//       actions: [
//         FloatingSearchBarAction(
//           showIfOpened: false,
//           child: CircularButton(
//             icon: const Icon(Icons.place),
//             onPressed: () {},
//           ),
//         ),
//         FloatingSearchBarAction.searchToClear(
//           showIfClosed: false,
//         ),
//       ],
//       builder: (context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Material(
//             color: Colors.white,
//             elevation: 4.0,
//             child: Consumer<All_users_provider>(
//               builder: (context, provider, child) {
//                 if (provider.usersModel != null) {
//                   return ListView.builder(
//                     itemCount: provider.usersModel!.users.length,
//                     itemBuilder: (context, index) {
//                       final user = provider.usersModel!.users[index];
//                       return ListTile(
//                         title: Text(user.userName),
//                         // Add your onTap logic here if needed
//                       );
//                     },
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
