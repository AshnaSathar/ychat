import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/favourites_model.dart';
import 'package:http/http.dart' as http;

class close_friends_provider extends ChangeNotifier {
  List<Favorite> favourites = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future get_list({required user_id, required token}) async {
    try {
      setLoading(true);
      final url =
          Uri.parse("http://127.0.0.1:8000/api/users/$user_id/favourites");
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = "Bearer $token";
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        FavouritesModel favouritesModel = favouritesModelFromJson(responseBody);
        favourites = favouritesModel.favorites;
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future add_as_close_friend(
      {required user_id, required fav_id, required token}) async {
    try {
      setLoading(true);
      final url = Uri.parse(
          "http://127.0.0.1:8000/api/users/$user_id/add-to-favourites");
      var response = await http.post(url,
          headers: {'Authorization': "Bearer $token"},
          body: {'user_id': fav_id});
      if (response.statusCode == 200) {
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
    }
  }

  Future remove_from_close_friend_list(
      {required friend_id, required user_id, required token}) async {
    try {
      setLoading(true);
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
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } catch (error) {
      print("Error is $error");
      setLoading(false);
      return false;
    }
  }
}
