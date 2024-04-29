import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Login_provider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool Loading) {
    _isLoading = Loading;
  }

  bool is_success = false;
  var user_id;
  var userName;
  var token;
  var email_id;
  var gender;
  var dob;
  late IO.Socket socket;

  Future post_db({required user_name, required password}) async {
    try {
      setLoading(true);
      final url = Uri.parse('http://127.0.0.1:8000/api/login');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'user_name': user_name, 'password': password}));
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        setLoading(false);
        final parse_response = jsonDecode(response.body);
        user_id = parse_response['user_id'];
        userName = parse_response['user_name'];
        token = parse_response['token'];
        is_success = true;
        print(token);
        socket = IO.io("http://localhost:3000/", <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': true
        });
        socket.onConnect((_) {
          socket.emit('connection');
        });
        socket.emit('storeSocket', {'uid': user_id});
        return true;
      } else {
        setLoading(false);
        is_success = false;
        return false;
      }
    } catch (error) {
      setLoading(false);
      return false;
    }
  }
}
