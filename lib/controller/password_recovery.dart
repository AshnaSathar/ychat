import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Password_recovery_provider extends ChangeNotifier {
  var reference_id;
  bool _isloading = false;
  bool get isLoading => _isloading;
  setLoading(bool Loading) {
    _isloading = Loading;
  }

  var message;
  Future send_otp({required email}) async {
    try {
      setLoading(true);
      final url = Uri.parse('http://127.0.0.1:8000/api/send-otp');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': email}));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response.body);
        final parse_response = jsonDecode(response.body);
        reference_id = parse_response['reference_id'];

        notifyListeners();
        setLoading(false);
        return true;
      } else {
        final parsed_response = jsonDecode(response.body);
        message = parsed_response['message'];
        print(message);
        print(response.statusCode);
        // print(response.body);
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("errod is $error");
      setLoading(false);
      return false;
    }
  }

  Future verify_otp({required otp, required user_reference_id}) async {
    user_reference_id = reference_id;
    final url = Uri.parse('http://127.0.0.1:8000/api/verifyOtp');
    var response = await http.post(url,
        body: ({"otp": otp, "reference_id": user_reference_id}));
    print(response.statusCode);
    if (response.statusCode == 200) {
      // print(response.body);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
