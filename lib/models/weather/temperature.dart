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
      current: HelperFunctions.kelvinToCelsius((map['temp'] as num).toDouble()),
      feelsLike: HelperFunctions.kelvinToCelsius(
          (map['feels_like'] as num).toDouble()),
      min: HelperFunctions.kelvinToCelsius((map['temp_min'] as num).toDouble()),
      max: HelperFunctions.kelvinToCelsius((map['temp_max'] as num).toDouble()),
    );
  }

  String get currentString => '${current.toInt().toString()}°';
  String get feelsLikeString => '${feelsLike.toInt().toString()}°';
}
