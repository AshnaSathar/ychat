import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login_provider extends ChangeNotifier {
  bool is_success = false;
  var user_id;
  var userName;
  var token;
  var email_id;
  var gender;
  var dob;
  Future post_db({required user_name, required password}) async {
    try {
      print("$user_name");
      print("$password");
      print("invoked login provider- post_db");
      final url = Uri.parse('http://127.0.0.1:8000/api/login');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_name': user_name, 'password': password}));
      print(response.statusCode);
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final parse_response = jsonDecode(response.body);
        user_id = parse_response['user_id'];
        userName = parse_response['user_name'];
        token = parse_response['token'];
        is_success = true;
        notifyListeners();
        return true;
      } else {
        is_success = false;
        print("Failed to post data");
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error posting data");
      return false;
    }
  }
}
