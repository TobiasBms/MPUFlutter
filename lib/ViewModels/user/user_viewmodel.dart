import 'package:flutter/foundation.dart';

class UserViewModel with ChangeNotifier {

  String _username = "";
  String _password = "";

  String get username => _username;
  String get password => _password;

  void createUser(String name, String pass){
    _username = name;
    _password = pass;
      notifyListeners();
  }

  Future updateUser(String name, String pass) async{
      _username = name;
      _password = pass;
      notifyListeners();
  }

}