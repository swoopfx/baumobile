import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class RequestListProvider with ChangeNotifier {
  List items = [];

  // Map<String, dynamic> config = {};

  final _authToken;

  RequestListProvider(this._authToken, this.items);

  Future<List> fetchActiveRequest() async {
    try {
      var url = Uri.parse(Config.baseUrl + "logistics/logistics/requests");
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_authToken',
      });
      var decodedResponse = json.decode(response.body);
      // print(decodedResponse);
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      if (decodedResponse["message"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      notifyListeners();
      // print(decodedResponse["data"]);
      items = decodedResponse['data'] as List;
      return decodedResponse['data'] as List;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchRiderInfo(String uid) async {
    try {
      var url =
          Uri.parse(Config.baseUrl + "logistics/logistics/riderinfo/$uid");
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_authToken',
      });
      var decodedResponse = json.decode(response.body);
      // print(decodedResponse);
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      if (decodedResponse["message"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      notifyListeners();
      return decodedResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> fetchRideInfo(String uid) async {
    try {
      var url = Uri.parse(Config.baseUrl + "logistics/logistics/rideinfo/$uid");
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_authToken',
      });
      var decodedResponse = json.decode(response.body);
      // print(decodedResponse);
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      if (decodedResponse["message"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      notifyListeners();
      return decodedResponse["data"];
    } catch (e) {
      rethrow;
    }
  }
}
