
import 'package:flutter/material.dart';
import 'package:recipesfood/resources/auth_methodes.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier {
  Users? _user;
  final AuthMethods _authMethods = AuthMethods();

  Users get getUser => _user!;

  Future<void> refreshUser() async {
    Users users = await _authMethods.getUserDetails();
    _user = users;
    notifyListeners();
  }
}