class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'],
      deg: map['deg'],
      gust: map['gust'],
    );
  }
}
