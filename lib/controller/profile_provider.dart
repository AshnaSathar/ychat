import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/profile_model.dart';
import 'package:http/http.dart' as http;

class Profile_provider extends ChangeNotifier {
  // var user_id;
  // var userName;
  // var token;
  // var emailId;
  // var gender;
  // var dob;
  // var bio;
  var my_profile;
  String? cover_image_url;
  String? profile_picture_url;
  ProfileModel? profile_responseData;
  ProfileModel? profile_my_details;
  var profile_image;
  var cover_image;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future get_my_details({required id, required reference_id}) async {
    print("profile_provider");
    setLoading(true);
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
        profile_my_details = ProfileModel.fromJson(jsonDecode(response.body));
        print(
            "my details are =============${profile_my_details?.user.profilePictureUrl}");
        print(
            "my profile picture is ${profile_my_details?.user.profilePicture}");
        // print(response.body);
        final parseResponse = jsonDecode(response.body);
        // var userData = parseResponse['user'];
        // user_id = userData['id'];
        // userName = userData['user_name'];
        // token = userData['reference_id'];
        // emailId = userData['email'];
        // gender = userData['gender'];
        // dob = userData['dob'];
        // bio = userData['bio'];
        cover_image_url = parseResponse['cover_image_url'];
        profile_picture_url = parseResponse['profile_picture_url'];
        print("-----------------------------------");
        print(profile_responseData);
        print(profile_responseData?.user.userName);
        print("-----------------------------------");
        // file_content = userData['file_contents'];
        // print("file contents is $file_content");
        // print("profile picture is $profile_picture_url");
        // print("Token generated is $token");
        // print("User ID is $user_id and username is $userName");

        // print("cover image is $cover_image_url");
        my_profile = "http://localhost:8000$profile_picture_url";
        cover_image = "http://localhost:8000$cover_image_url";
        // print("profile picture is $profile_image");
        // print("cover image is $cover_image ");
        setLoading(false);
        print(response.body);
        notifyListeners();
        return true;
      } else {
        print(response.body);
        setLoading(false);
        return false;
      }
    } catch (error) {
      setLoading(false);
      print("Error is $error");
    }
  }

  Future get_details({required id, required reference_id}) async {
    print("profile_provider");
    setLoading(true);
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
        profile_responseData = ProfileModel.fromJson(jsonDecode(response.body));
        // print(response.body);
        print(
            "friend details===========${profile_responseData?.user.userName}");
        final parseResponse = jsonDecode(response.body);
        // var userData = parseResponse['user'];
        // user_id = userData['id'];
        // userName = userData['user_name'];
        // token = userData['reference_id'];
        // emailId = userData['email'];
        // gender = userData['gender'];
        // dob = userData['dob'];
        // bio = userData['bio'];
        cover_image_url = parseResponse['cover_image_url'];
        profile_picture_url = parseResponse['profile_picture_url'];
        print("-----------------------------------");
        print(profile_responseData);
        print(profile_responseData?.user.userName);
        print("-----------------------------------");
        // file_content = userData['file_contents'];
        // print("file contents is $file_content");
        // print("profile picture is $profile_picture_url");
        // print("Token generated is $token");
        // print("User ID is $user_id and username is $userName");

        // print("cover image is $cover_image_url");
        profile_image = "http://localhost:8000$profile_picture_url";
        cover_image = "http://localhost:8000$cover_image_url";
        // print("profile picture is $profile_image");
        // print("cover image is $cover_image ");
        setLoading(false);
        print(response.body);
        notifyListeners();
        return true;
      } else {
        print(response.body);
        setLoading(false);
        return false;
      }
    } catch (error) {
      setLoading(false);
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
    setLoading(true);
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
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        // print(response.body);
        print("Failed");
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      print("Error is $error");
      return false;
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
    setLoading(true);
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
        setLoading(false);
        notifyListeners();

        return true;
      } else {
        // print(response.body);
        print("failed");
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      print("Error is $error");
      return false;
    }
  }

  Future update_profile_picture({required img}) async {}
}
