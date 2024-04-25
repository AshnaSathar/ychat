import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/user_model.dart';

class All_users_provider extends ChangeNotifier {
  UserModel? _usersModel;
  List<User>? _originalUsers;
  List<User> filteredUsers = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(Loading) {
    _isLoading = Loading;
  }

  UserModel? get usersModel => _usersModel;
  Future<void> getUsers({required String token}) async {
    setLoading(true);
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/users/get_all_users");
      var response = await http.get(url, headers: {
        "content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        _usersModel = UserModel.fromJson(jsonData);
        _originalUsers = _usersModel?.users.toList();
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (error) {
      print("Error: $error");
      setLoading(false);
    }

    notifyListeners();
  }

  void searchUsers({required searchTerm}) {
    setLoading(true);
    List users = [];
    if (_originalUsers != null) {
      filteredUsers = _originalUsers!
          .where((user) =>
              user.userName.toLowerCase().startsWith(searchTerm.toLowerCase()))
          .toList();
      filteredUsers.forEach(
        (element) {
          users.add(element.userName);
        },
      );
      _usersModel = UserModel(success: true, users: filteredUsers);
      setLoading(false);
      notifyListeners();
    }
  }
}
