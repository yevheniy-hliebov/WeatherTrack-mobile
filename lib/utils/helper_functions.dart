import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:weather_track/models/dayly_weather.dart';
import 'package:weather_track/models/weather.dart';

class HelperFunctions {
  static const double _kelvinOffset = 273.15;

  static dynamic bytesToJson(Uint8List bytes) {
    String decodedString = utf8.decode(bytes);
    return jsonDecode(decodedString);
  }

  static double kelvinToCelsius(double kelvin) {
    return kelvin - _kelvinOffset;
  }

  static String degreesToDirection(double degrees) {
    final directions = [
      'N',
      'NNE',
      'NE',
      'ENE',
      'E',
      'ESE',
      'SE',
      'SSE',
      'S',
      'SSW',
      'SW',
      'WSW',
      'W',
      'WNW',
      'NW',
      'NNW'
    ];
    final index = (degrees / 22.5).round() % 16;

    return directions[index];
  }

  static String formatDate(
      {required dynamic date, String newPattern = 'HH:mm EEEE, dd MMM yyyy'}) {
    DateTime dateTime;

    if (date is int) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    } else if (date is String) {
      dateTime = DateTime.parse(date);
    } else if (date is DateTime) {
      dateTime = date;
    } else {
      throw ArgumentError('Invalid dateInput type. Expected int or String.');
    }

    DateFormat dateFormat = DateFormat(newPattern);

    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  static List<DailyForecast> groupForecastsByDay(List<Weather> forecast) {
    Map<String, List<Weather>> groupedForecasts = {};

    for (var weather in forecast) {
      String dateKey = formatDate(date: weather.dtTxt, newPattern: 'dd.MM.yy');
      if (groupedForecasts.containsKey(dateKey)) {
        groupedForecasts[dateKey]!.add(weather);
      } else {
        groupedForecasts[dateKey] = [weather];
      }
    }

    List<DailyForecast> dailyForecasts = [];

    groupedForecasts.forEach((dateKey, forecasts) {
      dailyForecasts.add(DailyForecast(
        date: DateFormat('dd.MM.yy').parse(dateKey),
        forecast: forecasts,
      ));
    });

    // Сортуємо дні за датою
    dailyForecasts.sort((a, b) => a.date.compareTo(b.date));

    return dailyForecasts;
  }
}
