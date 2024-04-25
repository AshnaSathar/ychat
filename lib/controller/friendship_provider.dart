import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/friendship_model.dart';
import 'package:http/http.dart' as http;

class Friendship_provider extends ChangeNotifier {
  List<FriendListModel>? friends;
  FriendListModel? friendsModel;
  var length;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  Future add_friend(
      {required user_id, required token, required friend_uid}) async {
    try {
      setLoading(true);
      var url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/friends");
      var request = await http.MultipartRequest('POST', url);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['friend_id'] = friend_uid.toString();
      var response = await request.send();
      var responseBody = await utf8.decodeStream(response.stream);
      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
    }
  }

  Future get_friends({required int user_id, required String token}) async {
    try {
      setLoading(true);
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
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
    }
  }

  Future remove_friend(
      {required friend_id, required user_id, required token}) async {
    try {
      setLoading(true);
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
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } catch (error) {
      setLoading(false);
      return false;
    }
  }

  Future block_user(
      {required user_id, required friend_id, required token}) async {
    try {
      setLoading(true);
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/block");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));
      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      return false;
    }
  }

  Future un_block_user(
      {required user_id, required friend_id, required token}) async {
    try {
      setLoading(true);
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/unblock");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));
      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      return false;
    }
  }

  Future report_user(
      {required user_id, required token, required friend_id}) async {
    try {
      setLoading(true);
      final url = Uri.parse("http://127.0.0.1:8000/api/users/$user_id/unblock");
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({'blocked_user_id': friend_id}));
      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
        return true;
      } else {
        setLoading(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      setLoading(false);
      return false;
    }
  }
}
