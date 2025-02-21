class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromMap(Map<String, dynamic> map) {
    String description = map['description'];
    return WeatherCondition(
      id: map['id'],
      main: map['main'],
      description: description[0].toUpperCase() + description.substring(1),
      icon: map['icon'],
    );
  }
}
