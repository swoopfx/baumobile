import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/service_type.dart';
import '../model/service_type.dart';
import './restservice.dart';
import 'config.dart';

class ServiceTypes with ChangeNotifier {
  var _isLoaded = false;

  String _authToken = "";

  List<ServiceType> _items = [];

  List<ServiceType> get items {
    return [..._items];
  }

  String helpme = "Welcome";

  ServiceTypes(this._authToken, this._items);

  // void set items(data) {
  //   _items = data;
  // }

  // ServiceTypes() {
  //   // _items = nnn
  //   //     .map((e) => ServiceType(
  //   //         id: e["id"], serviceimage: e["image"], servicename: e["type"]))
  //   //     .toList();
  //   // var data;
  //   // RestService().getServiceTye().then((value) {
  //   //   _isLoaded = true;
  //   //   _items = value["data"];
  //   //   notifyListeners();

  //   //   // print(_items);
  //   // });
  //   // print(data);
  //   // });
  // }

  Future fetchService() async {
    // print(_authToken);
    try {
      var uuu = Uri.parse(Config.baseUrl + "logistics/logistics/service-type");
      final response = await http.get(uuu, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_authToken',
      });
      var extract = json.decode(response.body) as List<dynamic>;
      // print(json.decode(response.body));
      // final List<ServiceType> loadedServiceType = [];
      final List<ServiceType> loadedServiceType = extract
          .map((value) => ServiceType(
                id: value['id'].toString(),
                serviceimage: value['image'],
                servicename: value["type"],
              ))
          .toList();
      // extract.forEach((key, value) {
      //   loadedServiceType.add(ServiceType(
      //     id: value['id'],
      //     serviceimage: value['image'],
      //     servicename: value["type"],
      //   ));
      // });
      _items = loadedServiceType;
      // print("OOOOOOOOOOOOO");
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
