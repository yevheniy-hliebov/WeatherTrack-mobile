import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

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

  static String unixDateToString(int unixDate, String? newPattern) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixDate * 1000);

    DateFormat dateFormat = DateFormat(newPattern ?? 'HH:mm EEEE, dd MMM yyyy');

    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
}
