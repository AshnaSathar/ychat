import 'package:flutter/material.dart';

class Chat_provider extends ChangeNotifier {
  Future sendMsg({required sid, required msg, required rid}) async {
    notifyListeners();
  }
}
