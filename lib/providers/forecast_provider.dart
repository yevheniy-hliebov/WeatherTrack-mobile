import 'package:flutter/material.dart';

class ForecastProvider extends ChangeNotifier {
  int _currentDayTabIndex = 0;

  int get currentDayTabIndex => _currentDayTabIndex;

  void selectDay(int index) {
    _currentDayTabIndex = index;
    notifyListeners();
  }
}
