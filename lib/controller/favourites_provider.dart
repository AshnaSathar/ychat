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
}
