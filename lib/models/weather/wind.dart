import 'package:weather_track/utils/helper_functions.dart';

class Wind {
  final double speed;
  final double deg;
  final String direction;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.direction,
    required this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['deg'] as num).toDouble(),
      deg: (map['deg'] as num).toDouble(),
      direction:
          HelperFunctions.degreesToDirection((map['deg'] as num).toDouble()),
      gust: (map['deg'] as num).toDouble(),
    );
  }
}
