import 'package:weather_track/utils/helper_functions.dart';

class Wind {
  final double speed;
  final int deg;
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
      speed: map['speed'],
      deg: map['deg'],
      direction: HelperFunctions.degreesToDirection(map['deg']),
      gust: map['gust'],
    );
  }
}
