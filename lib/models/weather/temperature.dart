import 'package:weather_track/utils/helper_functions.dart';

class Temperature {
  final double current;
  final double feelsLike;
  final double min;
  final double max;

  Temperature({
    required this.current,
    required this.feelsLike,
    required this.min,
    required this.max,
  });

  factory Temperature.fromMap(Map<String, dynamic> map) {
    return Temperature(
      current: HelperFunctions.kelvinToCelsius(map['temp']),
      feelsLike: HelperFunctions.kelvinToCelsius(map['feels_like']),
      min: HelperFunctions.kelvinToCelsius(map['temp_min']),
      max: HelperFunctions.kelvinToCelsius(map['temp_max']),
    );
  }

  String get currentString => '${current.toInt().toString()}°';
  String get feelsLikeString => '${feelsLike.toInt().toString()}°';
}
