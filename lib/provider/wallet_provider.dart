import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class Walletprovider with ChangeNotifier {
  final _authToken;
  Map<String, dynamic> items = {};

  Map<String, dynamic> config = {};

  Walletprovider(this._authToken, this.items);

/**
 * Gets the balance of the wallet
 */
  Future<Map<String, dynamic>> fetchBalance() async {
    try {
      var url = Uri.parse(Config.baseUrl + "wallet/api/wallet-balance");
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

  Future fetchWalletConfig() async {
    try {
      var url = Uri.parse(Config.baseUrl + "wallet/api/payment-config");
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_authToken',
      });
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
      notifyListeners();
      return decodedResponse;
    } catch (e) {}
  }

  Future prefundConfig() async {
    var url = Uri.parse(Config.baseUrl + "wallet/api/prefund-wallet");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_authToken',
    });
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
    notifyListeners();
    return decodedResponse;
  }

  Future<Map> fundwallet(Map data) async {
    try {
      var url = Uri.parse(Config.baseUrl + "wallet/api/fund-wallet");
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode(data));
      // print(response.body);
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
      return decodedResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> chargeWallet(double amount) async {
    try {
      var url = Uri.parse(Config.baseUrl + "wallet/api/charge-wallet");
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode({"amount": amount}));
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
      return decodedResponse;
    } catch (e) {
      rethrow;
    }
  }

  // Future chargeCard
}
