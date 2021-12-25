import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'config.dart';
import '../model/logistic_model.dart';

class LogisticsProvider with ChangeNotifier {
  var _isLoaded = false;

  String _authToken = "";
  List<Map> _items = [];

  Map<String, dynamic> stats = {};

  // <Map> get items {
  //   return [..._items];
  // }

  LogisticsProvider(this._authToken, this.stats);

  Future<Map> fetchStats(Map value) async {
    try {
      var uuu =
          Uri.parse(Config.baseUrl + "logistics/logistics/calculate-stats");
      final response = await http.post(uuu,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode(value));

      var decodedResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      if (decodedResponse["message"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      stats = decodedResponse['data'];
      notifyListeners();
      return decodedResponse['data'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<dynamic, dynamic>> createDispatch(Map data) async {
    try {
      var uuu =
          Uri.parse(Config.baseUrl + "logistics/logistics/create-request");
      final response = await http.post(uuu,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode(data));

      var decodedResponse = json.decode(response.body);
      if (response.statusCode != 201) {
        throw json.decode(response.body);
      }
      if (decodedResponse["error"] != null) {
        throw HttpException(decodedResponse["error"]);
      }
      if (decodedResponse["message"] != null) {
        throw HttpException(decodedResponse["error"]);
      }

      notifyListeners();

      return decodedResponse['data'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteLogistics(String id) {
    var url = Uri.parse(Config.baseUrl + "logistics/logistics/deleterequest");
    return http
        .post(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $_authToken',
            },
            body: json.encode({"id": id}))
        .then((value) {
      if (value.statusCode != 202) {
        throw json.decode(value.body);
      }
      notifyListeners();
    });

    // var decodedResponse = json.decode(response.body);

    // if (decodedResponse["error"] != null) {
    //   throw HttpException(decodedResponse["error"]);
    // }
    // if (decodedResponse["message"] != null) {
    //   throw HttpException(decodedResponse["error"]);
    // }
    // stats = decodedResponse['data'];
  }
}
