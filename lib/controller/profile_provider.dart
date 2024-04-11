import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Profile_provider extends ChangeNotifier {
  var user_id;
  var userName;
  var token;
  var email_id;
  var gender;
  var dob;
  XFile? image;
  Future get_details({required id, required reference_id}) async {
    try {
      var url =
          Uri.parse("http://127.0.0.1:8000/api/users/$id/get-profile-details");
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $reference_id"
        },
      );
      print(response.statusCode);
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final parse_response = jsonDecode(response.body);
        var userData = parse_response['user'];
        user_id = userData['id'];
        userName = userData['user_name'];
        token = userData['reference_id'];
        email_id = userData['email'];
        image = userData['profile_picture'];
        gender = userData['gender'];
        dob = userData['dob'];
        print("token generated is $token");
        print("user id is ${user_id} and username is ${userName}");

        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future update_profile(
      {required name,
      required id,
      required reference_id,
      required gender,
      required mobile_number,
      required dob,
      required bio}) async {
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/user/$id/profile/update");
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $reference_id"
          },
          body: jsonEncode({
            'name': name,
            'gender': gender,
            'dob': dob,
            'mobile_number': mobile_number,
            'bio': bio
          }));
      if (response.statusCode == 200) {
        print("success");
        return true;
      } else {
        print(response.body);
        print("failed");
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future update_profile_picture({required img}) async {}
}
