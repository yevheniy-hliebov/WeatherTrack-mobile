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
      current: map['temp'],
      feelsLike: map['feels_like'],
      min: map['temp_min'],
      max: map['temp_max'],
    );
  }
}
