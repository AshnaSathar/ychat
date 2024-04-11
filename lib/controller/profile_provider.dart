import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Profile_provider extends ChangeNotifier {
  var user_id;
  var userName;
  var token;
  var emailId;
  var gender;
  var dob;
  String? imageUrl;
  var image;

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
      if (response.statusCode == 200) {
        final parseResponse = jsonDecode(response.body);
        var userData = parseResponse['user'];
        user_id = userData['id'];
        userName = userData['user_name'];
        token = userData['reference_id'];
        emailId = userData['email'];
        imageUrl = userData['profile_picture_url'];
        gender = userData['gender'];
        dob = userData['dob'];

        print("Token generated is $token");
        print("User ID is $user_id and username is $userName");
        print("Image URL is $imageUrl");
        print("http://127.0.0.1:8000$imageUrl");
        image = "http://127.0.0.1:8000$imageUrl";
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error is $error");
    }
  }

  Future updateProfile(
      {required name,
      required id,
      required referenceId,
      required gender,
      required mobileNumber,
      required dob,
      required bio}) async {
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/user/$id/profile/update");
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $referenceId"
          },
          body: jsonEncode({
            'name': name,
            'gender': gender,
            'dob': dob,
            'mobile_number': mobileNumber,
            'bio': bio
          }));
      if (response.statusCode == 200) {
        print("Success");
        return true;
      } else {
        print(response.body);
        print("Failed");
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
