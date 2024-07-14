import 'package:http/http.dart' as http;
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/utils/constants/api_constants.dart';
import 'package:weather_track/utils/exceptions/weather_exception.dart';
import 'package:weather_track/utils/helper_functions.dart';

class WeatherService {
  static Future<dynamic> getCurrentWeatherInCity(
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      '${APIContstants.weatherApiUrl}/weather?lat=$latitude&lon=$longitude&lang=${APIContstants.weatherApiLang}&appid=${APIContstants.weatherApiKey}&units=${APIContstants.weatherApiUnits}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = HelperFunctions.bytesToJson(response.bodyBytes);
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
      '${APIContstants.weatherApiUrl}/forecast?lat=$latitude&lon=$longitude&lang=${APIContstants.weatherApiLang}&appid=${APIContstants.weatherApiKey}&units=${APIContstants.weatherApiUnits}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedResponse = HelperFunctions.bytesToJson(response.bodyBytes);
      return Weather.fromMapList(decodedResponse['list']);
    } else {
      throw WeatherException('Failed to load data: ${response.statusCode}');
    }
  }
}
