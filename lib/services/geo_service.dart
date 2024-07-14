import 'package:http/http.dart' as http;
import 'package:weather_track/models/city.dart';
import 'package:weather_track/utils/bytes_to_json.dart';
import 'package:weather_track/utils/constants/api_constants.dart';
import 'package:weather_track/utils/exceptions/geo_exception.dart';

class GeoService {
  Future<List<City>> search(String cityNamePrefix) async {
    final url = Uri.parse(
      '${APIContstants.geoApiUrl}/cities?minPopulation=${APIContstants.geoPopulation}&namePrefix=$cityNamePrefix',
    );

    final response = await http.get(url, headers: {
      'X-RapidAPI-Key': APIContstants.xRapidapiKey,
    });

    if (response.statusCode == 200) {
      final decodedResponse = bytesToJson(response.bodyBytes);
      return City.fromMapList(decodedResponse['data']);
    } else {
      throw GeoException('Failed to load data: ${response.statusCode}');
    }
  }
}
