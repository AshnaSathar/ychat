import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/rooms_model.dart';
import 'package:http/http.dart' as http;

class Rooms_provider extends ChangeNotifier {
  List<Category> categories = [];
  Future fetch_rooms_data({required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/categories");
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = "Bearer $token";
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        RoomsModel roomsModel = roomsModelFromJson(responseBody);

        // Extract categories from the RoomsModel
        categories = roomsModel.categories;
        print(categories.length);
        print(categories);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }
}
