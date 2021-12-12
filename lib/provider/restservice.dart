import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';
// import 'package:flutter/foundation.dart';

class RestService {
  bool isLoading = true;

  bool isError = false;

  // String _token;
  // DateTime _expiryDate;
  // String _userid;

  // const RestService(String token = "", DateTime expiryDate, String userid) {
  //   this._token = token;
  //   this._expiryDate = expiryDate;
  //   this._userid = userid;
  // }

  String _baseUrl = Config.baseUrl;
  final Map<String, dynamic> header = {};
  //  Uri actionurl ;
  //  Uri acturl;

  // RestService() {}

  Future login(String username, String password) {
    // bool isSuccess = false;
    var uri = this.createUrl("jwt/api/login");

    return http
        .post(uri,
            body: json.encode({"phoneOrEmail": username, "password": password}))
        .then((value) {
      // trigger Navigation to home page
      Map data = json.decode(value.body);
    }).catchError((error) {
      throw error;
    });
  }

  Future register({
    required String phoneNumber,
    required String password,
    required String email,
    required String fullname,
  }) async {
    var uri = this.createUrl("jwt/api/register");
    final response = await http
        .post(uri,
            body: json.encode({
              "email": email,
              "password": password,
              "fullname": fullname,
              "phoneNumber": phoneNumber
            }))
        .then((value) {
      return value;
    }).catchError((err) {
      isError = true;
      throw err;
    });
    return response;
  }

/**
 * Used 
 */
  Future refreshToken(String userId) {
    var uri = this.createUrl("jwt/api/refresh");
    return http
        .post(uri, body: json.encode({}))
        .then((value) {})
        .catchError((err) {
      isError = true;
      throw err;
    });
  }

  Future userProfile() {
    // header.addAll({});
    String response = "";
    var uri = this.createUrl("jwt/api/refresh");
    return http.post(uri, body: json.encode({}));
  }

  // Begin logistics logic

  Future getDeliverytype() {
    var uri = this.createUrl("logistics/logistics/delivery-type");
    return http.post(uri, body: json.encode({}));
  }

  Future<dynamic> getServiceTye() async {
    var uri = createUrl("logistics/logistics/service-type");
    await http.get(uri);
    // .then((res) {
    //   // print(res.body);
    //   isLoading = false;
    //   return json.decode((res.body));
    // }).catchError((err) {
    //   isError = true;
    //   throw err;
    // });
  }

  Uri createUrl(String routeString) {
    return Uri.parse(_baseUrl + routeString);
  }
}
