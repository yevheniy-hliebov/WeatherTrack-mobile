import 'package:flutter/material.dart';
import 'package:weather_track/models/city.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/services/weather_service.dart';

enum WeatherInfoType {
  current,
  forecast,
}

class WeatherProvider extends ChangeNotifier {
  WeatherService weatherService = WeatherService();
  bool _isLoading = false;
  WeatherInfoType _weatherInfoType = WeatherInfoType.current;

  City? _selectedCity;
  Weather? currentWeather;
  List<Weather>? forecast;

  bool get isLoading => _isLoading;
  City? get selectedCity => _selectedCity;
  bool get isCurrentWeather => _weatherInfoType == WeatherInfoType.current;
  bool get isForecastWeather => _weatherInfoType == WeatherInfoType.forecast;

  void selectWeatherInfoType(WeatherInfoType weatherInfoType) {
    _weatherInfoType = weatherInfoType;
    notifyListeners();
    if (weatherInfoType == WeatherInfoType.forecast && (forecast == null || forecast!.isEmpty)) {
      getWeather();
    }
  }

  void selectCity(City selectedCity) {
    _selectedCity = selectedCity;
    notifyListeners();
    getWeather();
  }

  Future<void> getWeather() async {
    _startLoading();

    if (_selectedCity == null) {
      _stopLoading();
      return;
    }

    try {
      if (_weatherInfoType == WeatherInfoType.current) {
        currentWeather = await weatherService.getCurrentWeatherInCity(
          _selectedCity!.latitude,
          _selectedCity!.longitude,
        );
      } else {
        forecast = await weatherService.getForecastInCity(
          _selectedCity!.latitude,
          _selectedCity!.longitude,
        );
      }
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
