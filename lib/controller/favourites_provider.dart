import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/favourites_model.dart';
import 'package:http/http.dart' as http;

class Favourites_provider extends ChangeNotifier {
  List<Favorite> favourites = [];
  Future get_list({required user_id, required token}) async {
    print("invoked");
    try {
      final url =
          Uri.parse("http://127.0.0.1:8000/api/users/$user_id/favourites");
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = "Bearer $token";
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        FavouritesModel favouritesModel = favouritesModelFromJson(responseBody);
        favourites = favouritesModel.favorites;
        // print("favorites is ${favourites}");
        // final parsed_response = jsonDecode(responseBody);
        notifyListeners();
        return true;
      } else {
        // print(responseBody);
        // print("failed");
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future add_to_fav({required user_id, required fav_id, required token}) async {
    try {
      final url = Uri.parse(
          "http://127.0.0.1:8000/api/users/$user_id/add-to-favourites");
      var request = await http.MultipartRequest('POST', url);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['user_id'] = fav_id;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        // print(responseBody);
        notifyListeners();
        return true;
      } else {
        // print("failed");
        // print(responseBody);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Erro is $error");
    }
  }

  Future remove_from_list(
      {required friend_id, required user_id, required token}) async {
    try {
      final url = Uri.parse(
          "http://127.0.0.1:8000/api/users/$user_id/remove-from-favourites");
      final response = await http.delete(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'user_id': friend_id}));

      var jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        favourites.removeWhere((friend) => friend.id == friend_id);
        notifyListeners();
        return true;
      } else {
        print("failed");
        return false;
      }
    } catch (error) {
      print("Error is $error");
      return false;
    }
  }
}
