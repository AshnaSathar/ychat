import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/rooms_model.dart';
import 'package:http/http.dart' as http;

class Rooms_provider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Category>? search_result;
  List<Category>? filtered_rooms;
  setLoading(Loading) {
    _isLoading = Loading;
  }

  List<Category> categories = [];
  Future fetch_rooms_data({required token}) async {
    setLoading(true);
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/categories");
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = "Bearer $token";
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        RoomsModel roomsModel = roomsModelFromJson(responseBody);
        categories = roomsModel.categories;
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      print("Error is $error");
      return false;
    }
  }

  void searchRooms({required String searchTerm}) {
    if (searchTerm.isEmpty) {
      filtered_rooms = null;
      notifyListeners();
      return;
    }
    if (categories.isNotEmpty) {
      filtered_rooms = categories
          .where((category) =>
              category.name.toLowerCase().startsWith(searchTerm.toLowerCase()))
          .toList();
      filtered_rooms?.forEach((category) {});
      notifyListeners();
    }
  }
}

// Consumer<Favourite_rooms_provider>(
//                           builder: (context, value, child) => Provider.of<
//                                           Favourite_rooms_provider>(context,
//                                       listen: false)
//                                   .show_fav
//                               ? ExpansionTile(
//                                   title: Text(
//                                     "Favourite rooms",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.red,
//                                       fontFamily:
//                                           GoogleFonts.inter().fontFamily,
//                                     ),
//                                   ),
//                                   children: [
//                                     Container(
//                                       color: Color_constant.secondaryColor,
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: Provider.of<
//                                                     Favourite_rooms_provider>(
//                                                 context,
//                                                 listen: false)
//                                             .rooms_fav
//                                             .length,
//                                         itemBuilder: (context, index) {
//                                           return ListTile(
//                                             trailing: InkWell(
//                                               onTap: () {
//                                                 context.push('/room_chat_page');
//                                               },
//                                               child: Icon(
//                                                 Icons.send,
//                                                 color:
//                                                     Color_constant.primaryColor,
//                                               ),
//                                             ),
//                                             title: Text(
//                                               "${Provider.of<Favourite_rooms_provider>(context, listen: false).rooms_fav[index].name}",
//                                               style:
//                                                   Text_style_constant.tab_style,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               : Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "Categories",
//                                         style: Text_style_constant.H4_purple,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                         ),
