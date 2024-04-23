import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/model/favourites_model.dart';
import 'package:flutter_application_1/model/rooms_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Append extends ChangeNotifier {
  List<Favorite> favourites = [];
  List<Category> categories = [];
  List myList = [];
  Future<bool> get_list({required user_id, required token}) async {
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
        notifyListeners();
        print(responseBody);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error is $error");
      return false;
    }
  }

  Future<bool> fetch_rooms_data({required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/categories");
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = "Bearer $token";
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        RoomsModel roomsModel = roomsModelFromJson(responseBody);
        categories = roomsModel.categories;
        print(responseBody);
        notifyListeners();

        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error is $error");
      return false;
    }
  }

  Future<void> appendList({context}) async {
    await get_list(
        token: Provider.of<Login_provider>(context, listen: false).token,
        user_id: Provider.of<Login_provider>(context, listen: false).user_id);
    await fetch_rooms_data(
        token: Provider.of<Login_provider>(context, listen: false).token);

    myList.addAll(favourites);
    myList.addAll(categories);
    print(myList);
    notifyListeners();
  }
}
