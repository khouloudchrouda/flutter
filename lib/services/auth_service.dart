import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prianou_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  static User currentUser;
  static String token;

  AuthService() {
    print("new AuthService");
  }

  static Future setUser({User user, String token = ''}) async {
    AuthService.currentUser = user;
    log("Saved user :");
    log("user : ${user.toString()}");
    if (token != '') {
      AuthService.token = token;
      log("token : $token");
      final prefs = await SharedPreferences.getInstance();
      String userToStore = jsonEncode(user.toJson());
      log(userToStore);
      prefs.setString("token", token);
      prefs.setString("user", userToStore);
    }
  }

  static Future<String> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<bool> isConnected() async {
    String token = await getToken();
    return token != "" && token != null;
  }

  static Future<User> getUser() async{
    final prefs = await SharedPreferences.getInstance();
    String storedUser = prefs.getString("user");
    if (storedUser == null) {
      return Future.value(null);
    }
    Map<String, dynamic> decodedUser = jsonDecode(storedUser);
    var driver = User.fromJson(decodedUser);
    return Future.value(driver);
  }

  static Future logout() async {
    AuthService.currentUser = null;
    AuthService.token = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", null);
    prefs.setString("user", null);
    return Future.value(currentUser);
  }
}
