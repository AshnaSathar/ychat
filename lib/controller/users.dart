import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/user_model.dart';

class All_users_provider extends ChangeNotifier {
  UserModel? _usersModel;
  List<User>? _originalUsers;
  List<User> filteredUsers = [];

  UserModel? get usersModel => _usersModel;

  Future<void> getUsers({required String token}) async {
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/users/get_all_users");
      var response = await http.get(url, headers: {
        "content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        // print(response.body);s
        var jsonData = json.decode(response.body);
        _usersModel = UserModel.fromJson(jsonData);
        _originalUsers = _usersModel?.users.toList(); // Store the original list
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }

    notifyListeners();
  }

  void searchUsers({required searchTerm}) {
    print(searchTerm);
    List users = [];
    if (_originalUsers != null) {
      filteredUsers = _originalUsers!
          .where((user) =>
              user.userName.toLowerCase().startsWith(searchTerm.toLowerCase()))
          .toList();
      filteredUsers?.forEach(
        (element) {
          users.add(element.userName);
        },
      );
      print("filtered users are ${users}");
      _usersModel = UserModel(success: true, users: filteredUsers);
      notifyListeners();
    }
  }
}
