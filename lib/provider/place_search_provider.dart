import 'package:flutter/material.dart';
import '../services/place_service.dart';
import '../model/place_search.dart';

class PlaceSearchProvider with ChangeNotifier {
  List<PlaceSearch> searchResult = [];

  List<PlaceSearch> destinationResult = [];

  PlaceService placeService = PlaceService();
  searchPlaces(String searchTerm) async {
    searchResult = await placeService.getAutoComplete(searchTerm);
    notifyListeners();
  }

  destinationSearchPlace(String search) async {
    destinationResult = await placeService.getAutoComplete(search);
    // print(destinationResult);
    notifyListeners();
  }

  // getLatitude
}
