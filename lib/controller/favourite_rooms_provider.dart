import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/rooms_fav_model.dart';
import 'package:http/http.dart' as http;

class Favourite_rooms_provider extends ChangeNotifier {
  List<Favorite> rooms_fav = [];
  bool show_fav = false;
  Future get_list({required user_id, required token}) async {
    try {
      print("inside fav room to fetch fav list ");
      final url =
          Uri.parse('http://127.0.0.1:8000/api/users/$user_id/favorite-rooms');
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        RoomsFavModel room_fav_model = roomsFavModelFromJson(response.body);
        rooms_fav = room_fav_model.favorites;
        print(response.body);

        print(rooms_fav);
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print("error is $error");
    }
  }

  Future toggle_fav_button({required bool value}) async {
    if (value == true) {
      show_fav = false;
      notifyListeners();
      return show_fav;
    } else {
      show_fav = true;
      notifyListeners();
      return show_fav;
    }
  }
}
