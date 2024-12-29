import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String? _name;
  String? _rollNo;
  String? _email;
  String? _password;

  String? get name => _name;
  String? get rollNo => _rollNo;
  String? get email => _email;
  String? get password => _password;

  void setUserDetails(String name, String rollNo, String email, String password) {
    _name = name;
    _rollNo = rollNo;
    _email = email;
    _password = password;
    notifyListeners(); // Notify listeners to update UI
  }

  void clear() {
    _name = null;
    _rollNo = null;
    _email = null;
    _password = null;
    notifyListeners();
  }
}
