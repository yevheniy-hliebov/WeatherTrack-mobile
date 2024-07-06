import 'package:http/http.dart' as http;
import 'package:weather_track/config/config.dart';
import 'package:weather_track/exceptions/weather_exception.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/utils/bytes_to_json.dart';

class WeatherService {
  static Future<dynamic> getCurrentWeatherInCity(
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      '${Config.weatherApiUrl}/weather?lat=$latitude&lon=$longitude&lang=${Config.weatherApiLang}&appid=${Config.weatherApiKey}&units=${Config.weatherApiUnits}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = bytesToJson(response.bodyBytes);
      return Weather.fromMap(decodedResponse);
    } else {
      throw WeatherException('Failed to load data: ${response.statusCode}');
    }
  }

  static Future<dynamic> getForecastInCity(
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      '${Config.weatherApiUrl}/forecast?lat=$latitude&lon=$longitude&lang=${Config.weatherApiLang}&appid=${Config.weatherApiKey}&units=${Config.weatherApiUnits}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = bytesToJson(response.bodyBytes);
      return Weather.fromMapList(decodedResponse['list']);
    } else {
      throw WeatherException('Failed to load data: ${response.statusCode}');
    }
  }
}
