import 'package:weather_track/models/weather.dart';

class DailyForecast {
  final DateTime date;
  final List<Weather> forecast;

  DailyForecast({required this.date, required this.forecast});
}
