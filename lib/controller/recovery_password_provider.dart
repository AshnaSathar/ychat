import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class recover_password_provider extends ChangeNotifier {
  var user_id;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future get_user_details({required email_id}) async {
    try {
      setLoading(true);
      final url = Uri.parse("http://127.0.01:8000/api/users/get-by-email");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email_id;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        final parsed_response = jsonDecode(responseBody);
        user_id = parsed_response['user_id'];
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error is $error");
      return false;
    }
  }

  Future post_forget_password(
      {required password, required password_confirmation}) async {
    try {
      setLoading(true);
      final url =
          Uri.parse("http://127.0.0.1:8000/api/users/$user_id/forget-password");
      var request = http.MultipartRequest('POST', url);
      request.fields['password'] = password;
      request.fields['password_confirmation'] = password_confirmation;
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
      print("Error is $error");
    }
  }
}
