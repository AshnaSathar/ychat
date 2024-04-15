import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:http/http.dart' as http;

class Friendship_provider extends ChangeNotifier {
  List<FriendListModel>? friends;
  FriendListModel? friendsModel;
  var length;

  Future add_friend(
      {required user_id, required token, required friend_uid}) async {
    try {
      print("user_id is $user_id");
      print("friend_uid is $friend_uid");
      print("token received is $token");
      var url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      var request = await http.MultipartRequest('POST', url);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['friend_id'] = friend_uid.toString();
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      print(response.statusCode);
      print('Response body: ${responseBody}');
      if (response.statusCode == 200) {
        print(responseBody);
        notifyListeners();
        return true;
      } else {
        print("failed");
        print(responseBody);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("error is $error");
    }
  }

  Future get_friends({required int user_id, required String token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        friendsModel = FriendListModel.fromJson(jsonData);
        print("---------------${response.body}");
        notifyListeners();
        return true;
      } else {
        print("Request failed with status: ${response.statusCode}");
        print(response.body);
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error occurred: $error");
    }
  }

  Future remove_friend(
      {required friend_id, required user_id, required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      final response = await http.delete(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'friend_id': friend_id}));

      var jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        friendsModel?.friends.removeWhere((friend) => friend.id == friend_id);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error removing friend: $error");
      return false;
    }
  }

  Future block_user(
      {required user_id, required friend_id, required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/block");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error blocking user: $error");
      return false;
    }
  }

  Future un_block_user(
      {required user_id, required friend_id, required token}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/unblock");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error blocking user: $error");
      return false;
    }
  }

  Future report_user(
      {required user_id, required token, required friend_id}) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/unblock");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (error) {
      print("Error blocking user: $error");
      return false;
    }
  }
}
