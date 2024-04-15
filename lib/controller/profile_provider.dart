import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile_provider extends ChangeNotifier {
  var user_id;
  var userName;
  var token;
  var emailId;
  var gender;
  var dob;
  var bio;
  String? cover_image_url;
  String? profile_picture_url;

  var profile_image;
  var cover_image;

  Future get_details({required id, required reference_id}) async {
    print("profile_provider");
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
        print(response.body);
        final parseResponse = jsonDecode(response.body);
        var userData = parseResponse['user'];
        user_id = userData['id'];
        userName = userData['user_name'];
        token = userData['reference_id'];
        emailId = userData['email'];
        gender = userData['gender'];
        dob = userData['dob'];
        bio = userData['bio'];
        cover_image_url = parseResponse['cover_image_url'];
        profile_picture_url = parseResponse['profile_picture_url'];

        // file_content = userData['file_contents'];
        // print("file contents is $file_content");
        print("profile picture is $profile_picture_url");
        print("Token generated is $token");
        print("User ID is $user_id and username is $userName");

        print("cover image is $cover_image_url");
        profile_image = "http://localhost:8000$profile_picture_url";
        cover_image = "http://localhost:8000$cover_image_url";
        print("profile picture is $profile_image");
        print("cover image is $cover_image ");
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
