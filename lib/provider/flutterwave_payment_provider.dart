import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'config.dart';

class FlutterwavePaymentProvider with ChangeNotifier {
  var _isLoaded = false;

  String _authToken = "";
  Map items = {};

  // Map<String, dynamic> stats = {};

  FlutterwavePaymentProvider(this._authToken, this.items);

  Future verifypayment(String txRef, String amountPayed) async {
    try {
      var uuu = Uri.parse(Config.baseUrl + "wallet/api/verifypayment");
      final response = await http.post(uuu,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode({
            "status": "success",
            "txRef": txRef,
            "amountPayed": amountPayed
          }));

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
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> verifypaymentPaystack(String reference) async {
    try {
      var uuu = Uri.parse(Config.baseUrl + "wallet/api/verifypaymentpaystack");
      final response = await http.post(uuu,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_authToken',
          },
          body: json.encode({
            // "status": "success",
            "transactionReference": reference,
            // "amountPayed": amountPayed
          }));

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
      return decodedResponse["data"];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> paymentConfig() async {
    try {
      var uuu = Uri.parse(Config.baseUrl + "wallet/api/prefund-wallet");
      final response = await http.get(uuu, headers: {
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
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> paymentConfigMonnify() async {
    try {
      var uuu = Uri.parse(Config.baseUrl + "wallet/api/prefund-wallet-monnify");
      final response = await http.get(uuu, headers: {
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
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> paymentConfigPaystack() async {
    try {
      var uuu =
          Uri.parse(Config.baseUrl + "wallet/api/prefund-wallet-paystack");
      final response = await http.get(uuu, headers: {
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
    } catch (e) {
      rethrow;
    }
  }
}
