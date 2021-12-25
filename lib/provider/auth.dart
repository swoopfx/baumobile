import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class Auth with ChangeNotifier {
  String _baseUrl = Config.baseUrl;
  String _token = "";
  DateTime _expiryDate = DateTime(2021);

  bool isrefeshing = false;
  String _userId = "";

  String _preferenceKey = "thisuser";

  bool get isAuth {
    if (token == "") {
      return false;
    } else {
      return true;
    }
  }

  String get token {
    if (_token != "") {
      return _token;
    }
    return "";
  }

  Future<http.Response> register({
    required String phoneNumber,
    required String password,
    required String email,
    required String fullname,
  }) async {
    try {
      var uri = createUrl("jwt/api/register");
      final response = await http.post(uri,
          body: json.encode({
            "email": email,
            "password": password,
            "fullname": fullname,
            "phoneNumber": phoneNumber
          }));
      if (response.statusCode != 201) {
        throw json.decode(response.body);
      }
      notifyListeners();
      return response;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  Future<http.Response> login(String username, String password) async {
    try {
      var uri = createUrl("jwt/api/login");
      final response = await http.post(uri,
          body: json.encode({"phoneOrEmail": username, "password": password}));
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }
      var decodedResponse = json.decode(response.body);
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      _token = decodedResponse["token"];
      _userId = decodedResponse["userid"].toString();
      notifyListeners();
      final preference = await SharedPreferences.getInstance();
      preference.setString(_preferenceKey, _userId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refreshToken(String userid) async {
    isrefeshing = true;
    try {
      var uri = createUrl("jwt/api/refreshtoken");
      final response = await http.post(uri, body: json.encode({"uid": userid}));

      var decodedResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }

      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      _token = decodedResponse["token"];
      _userId = decodedResponse["userid"];

      isrefeshing = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    _token = "";
    _userId = "";
    pref.remove(_preferenceKey);

    notifyListeners();
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_preferenceKey)) {
      // notifyListeners();
      return false;
    }
    final userData = prefs.getString(_preferenceKey);
    // call referesh token
    await refreshToken(userData.toString());
    // notifyListeners();
    return true;
  }

  Uri createUrl(String routeString) {
    return Uri.parse(_baseUrl + routeString);
  }
}
