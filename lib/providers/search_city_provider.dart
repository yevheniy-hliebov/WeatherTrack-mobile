import 'package:flutter/material.dart';
import 'package:weather_track/models/city.dart';
import 'package:weather_track/services/geo_service.dart';
import 'package:weather_track/utils/debouncer.dart';

class SearchCityProvider extends ChangeNotifier {
  Debouncer debouncer = Debouncer(milliseconds: 1200);
  GeoService geoService = GeoService();

  List<City> listCities = [];
  List<City> listDefaultCities = [];
  City? selectedCity;

  bool isLoading = false;

  int get resultCount => listCities.length;

  void searchCities(String cityNamePrefix) {
    _startLoading();
    debouncer.run(() async {
      try {
        listCities = await geoService.search(cityNamePrefix);
        if (listDefaultCities.isEmpty) {
          listDefaultCities = listCities;
        }
      } finally {
        _stopLoading();
      }
    });
  }

  void searchDefaultCities() {
    if (listDefaultCities.isEmpty) {
      searchCities('');
    } else {
      listCities = listDefaultCities;
      notifyListeners();
    }
  }

  void selectCity(int index) {
    selectedCity = listCities[index];
    notifyListeners();
  }

  void _startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}
