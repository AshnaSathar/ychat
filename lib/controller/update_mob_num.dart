import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mob_num_provider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(Loading) {
    _isLoading = Loading;
  }

  Future update_mob({
    required newMob,
    required userId,
    required token,
  }) async {
    try {
      setLoading(true);
      var url = Uri.parse(
          "http://127.0.0.1:8000/api/users/$userId/update-mobile-number");

      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'mobile_number': newMob.toString()}),
      );

      var responseBody = response.body;
      print(url);
      print(responseBody);

      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (e) {
      setLoading(false);
      notifyListeners();
      print("An error occurred: $e");
      return false;
    }
  }
}
