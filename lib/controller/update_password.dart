import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Update_password_provider extends ChangeNotifier {
  Future update_password(
      {required user_id,
      required old_password,
      required new_password,
      required new_password_confirmation}) async {
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
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("error is $error");
    }
  }
//  Future Update_password(
//    {required password, required password_confirmation}) async {
//     try {
//       final url =
//           Uri.parse("http://127.0.0.1:8000/api/users/$user_id/forget-password");
//       var request = http.MultipartRequest('POST', url);
//       request.fields['password'] = password;
//       request.fields['password_confirmation'] = password_confirmation;
//       var response = await request.send();
//       var responseBody = await utf8.decodeStream(response.stream);
//       if (response.statusCode == 200) {
//         // print("true..");
//         // print(responseBody);
//         return true;
//       } else {
//         // print(responseBody);
//         // print("false");
//         return false;
//       }
//     } catch (error) {
//       print("Error is $error");
//     }
//   }
}
