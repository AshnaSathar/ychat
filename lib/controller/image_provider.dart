import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class File_provider extends ChangeNotifier {
  Future upload_profile_picture(
      {required user_id, required image_path, required token}) async {
    try {
      final url =
          Uri.parse('http://127.0.0.1:8000/api/user/$user_id/profile/update');
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(
          {'profile_picture': image_path},
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        // final parse_response = jsonDecode(response.body);

        notifyListeners();
        return true;
      } else {
        print(response.statusCode);
        print(response.body);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("errod is $error");
    }
  }
}
