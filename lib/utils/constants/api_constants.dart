import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIContstants {
  static final String weatherApiKey = dotenv.get('WEATHER_API_KEY');
  static final String weatherApiUrl = dotenv.get('WEATHER_API_URL');
  static final String weatherApiUnits = dotenv.get('WEATHER_API_UNITS');

  static final String xRapidapiKey = dotenv.get('X_RAPIDAPI_KEY');
  static final String geoApiUrl = dotenv.get('GEO_API_URL');
  static final String geoPopulation = dotenv.get('GEO_POPULATION');
}
