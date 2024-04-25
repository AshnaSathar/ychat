import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Update_password_provider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future update_password(
      {required user_id,
      required old_password,
      required new_password,
      required new_password_confirmation}) async {
    setLoading(true);
    try {
      final url =
          Uri.parse("http://127.0.0.1:8000/api/users/$user_id/password-update");
      var request = http.MultipartRequest('POST', url);
      request.fields['old_password'] = old_password;
      request.fields['new_password'] = new_password;
      request.fields['new_password_confirmation'] = new_password_confirmation;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
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
      print("error is $error");
      return false;
    }
  }
}
