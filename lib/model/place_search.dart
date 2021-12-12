import 'package:flutter/foundation.dart';

class PlaceSearch {
  final String description;
  final String placeId;

  PlaceSearch({required this.placeId, required this.description});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
        placeId: json["place_id"], description: json["description"]);
  }
}
