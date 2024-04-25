import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/block_user_model.dart';
import 'package:http/http.dart' as http;

class Block_Provider extends ChangeNotifier {
  BlockUserModel? block_responseData;
  Future get_block_list({required user_id, required token}) async {
    try {
      var url =
          Uri.parse('http://127.0.0.1:8000/api/users/$user_id/blocked-users');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        block_responseData = BlockUserModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("error is $error");
      return false;
    }
  }
}
