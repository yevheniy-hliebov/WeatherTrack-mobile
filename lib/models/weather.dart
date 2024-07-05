import 'weather/atmospheric_pressure.dart';
import 'weather/temperature.dart';
import 'weather/weather_condition.dart';
import 'weather/wind.dart';

class Weather {
  final WeatherCondition condition;
  final Temperature temperature;
  final int humidity;
  final int visibility;
  final AtmosphericPressure pressure;
  final Wind wind;
  final int clouds;
  final double? rain1h;
  final double? rain3h;
  final double? snow1h;
  final double? snow3h;
  final int? unixDate;
  final int? timezone;
  final String? dtTxt;

  Weather({
    required this.condition,
    required this.temperature,
    required this.humidity,
    required this.visibility,
    required this.pressure,
    required this.wind,
    required this.clouds,
    this.rain1h,
    this.rain3h,
    this.snow1h,
    this.snow3h,
    this.unixDate,
    this.timezone,
    this.dtTxt,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      condition: WeatherCondition.fromMap(map['weather'][0]),
      temperature: Temperature.fromMap(map['main']),
      humidity: map['main']['humidity'],
      visibility: map['visibility'],
      pressure: AtmosphericPressure.fromMap(map['main']),
      wind: Wind.fromMap(map['wind']),
      clouds: map['clouds']['all'],
      rain1h: map['rain'] != null ? map['rain']['1h'] : null,
      rain3h: map['rain'] != null ? map['rain']['3h'] : null,
      snow1h: map['snow'] != null ? map['snow']['1h'] : null,
      snow3h: map['snow'] != null ? map['snow']['3h'] : null,
      unixDate: map['dt'],
      timezone: map['timezone'],
      dtTxt: map['dt_txt'],
    );
  }

  static List<Weather> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => Weather.fromMap(map)).toList();
  }
}
