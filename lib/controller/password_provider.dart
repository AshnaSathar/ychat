import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Passsword_provider extends ChangeNotifier {
  var user_id;
  Future get_user_details({required email_id}) async {
    try {
      final url = Uri.parse("http://127.0.01:8000/api/users/get-by-email");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email_id;
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        final parsed_response = jsonDecode(responseBody);
        user_id = parsed_response['user_id'];
        print("true..");
      } else {
        print(responseBody);
        print("false");
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future forget_password({required email_id}) async {}
}
