import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register_provider extends ChangeNotifier {
  var referenceId;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future<bool> request_otp({
    required String name,
    required String dob,
    required String gender,
    required String password,
    required String user_name,
    required String email_id,
  }) async {
    gender = "female";
    try {
      setLoading(true);
      var url = Uri.parse("http://127.0.0.1:8000/api/request-otp");
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email_id;
      request.fields['password'] = password;
      request.fields['password_confirmation'] = password;
      request.fields['name'] = name;
      request.fields['user_name'] = user_name;
      request.fields['gender'] = gender;
      request.fields['dob'] = dob;

      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);

      // print('Response status: ${response.statusCode}');
      // print('Response body: $responseBody');

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(responseBody);
        referenceId = parsedResponse['reference_id'];
        print(responseBody);
        // print("User reference id is $referenceId");

        // Save cookies
        // final cookies = response.headers['set-cookie'];
        // if (cookies != null) {
        //   final cookieJar = CookieJar();
        //   final uri = Uri.parse("http://127.0.0.1:8000");
        //   final cookieList = cookies.split(', ');
        //   final parsedCookies =
        //       cookieList.map((cookie) => Cookie.fromSetCookieValue(cookie));
        //   cookieJar.saveFromResponse(uri, parsedCookies.toList());
        // You can store this `cookieJar` instance for future use.
        // }
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } catch (error) {
      setLoading(false);
      print("Error is $error");
      return false;
    }
  }
  // Future request_otp(
  //     {required name,
  //     required user_name,
  //     required dob,
  //     required gender,
  //     required password,
  //     required email_id}) async {
  //   gender = "female";
  //   try {
  //     var url = Uri.parse("http://127.0.0.1:8000/api/request-otp");
  //     var request = http.MultipartRequest('POST', url);
  //     request.fields['email'] = email_id;
  //     request.fields['password'] = password;
  //     request.fields['password_confirmation'] = password;
  //     request.fields['name'] = name;
  //     request.fields['user_name'] = user_name;
  //     request.fields['gender'] = gender;
  //     request.fields['dob'] = dob;
  //     var response = await request.send();
  //     var responseBody = await utf8.decodeStream(response.stream);
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: $responseBody');

  //     if (response.statusCode == 200) {
  //       final parsed_response = jsonDecode(responseBody);

  //       reference_id = parsed_response['reference_id'];
  //       print("user reference id is ${reference_id}");
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (error) {
  //     print("Error is $error");
  //   }
  // }

  // Future verify_otp_register({required reference_id, required otp}) async {
  //   try {
  //     var url = Uri.parse("http://127.0.0.1:8000/api/verify-otp-and-register");
  //     var request = http.MultipartRequest('POST', url);

  //     request.fields['reference_id'] = reference_id;
  //     request.fields['otp'] = otp;
  //     var response = await request.send();
  //     var responseBody = await utf8.decodeStream(response.stream);
  //     if (response.statusCode == 200) {
  //       print("true");
  //       return true;
  //     } else {
  //       print("false");
  //       print("responseBody is $responseBody");
  //       return false;
  //     }
  //   } catch (error) {
  //     print("Error is $error");
  //   }
  // }

  Future<bool> verify_otp_register({required otp}) async {
    try {
      print(referenceId);
      print(otp);
      var url = Uri.parse("http://127.0.0.1:8000/api/verify-otp-and-register");
      var request = http.MultipartRequest('POST', url);

      request.fields['reference_id'] = referenceId;
      request.fields['otp'] = otp;

      // Get cookies from shared preferences or wherever you stored them after receiving from backend
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final String? savedCookies = prefs.getString('cookies');

      // If cookies exist, add them to the request
      // if (savedCookies != null) {
      //   request.headers['cookie'] = savedCookies;
      // }

      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        print(responseBody);
        // print("true");
        return true;
      } else {
        // print("false");
        // print("responseBody is $responseBody");
        return false;
      }
    } catch (error) {
      print("Error is $error");
      return false;
    }
  }
}
