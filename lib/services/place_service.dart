import 'dart:convert' as convert;
import '../model/place_search.dart';
import 'package:http/http.dart' as http;
import '../model/place_search.dart';
import '../provider/config.dart';
import '../model/place_longitude_latitude.dart';

class PlaceService {
  final googleKey = Config.googleApiKey;

  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    // print(search);
    // print(googleKey);
    var url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&components=country:ng&language=pt_BR&key=$googleKey";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['predictions'] as List;
    // print(jsonResult);
    return jsonResult.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Map> getLatitudeLongitude(String place_id) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$place_id&fields=formatted_address,geometry&key=$googleKey";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map;

    return jsonResult;
    // return PlaceLongitudeLatitude(
    //     placeId: place_id,
    //     longitude: jsonResult["geometry"]["location"]["lng"],
    //     latitude: jsonResult["geometry"]["location"]["lat"],
    //     address: jsonResult["formatted_address"]);
  }
}
