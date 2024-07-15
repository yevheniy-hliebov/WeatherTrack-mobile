import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/forecast_provider.dart';
import 'package:weather_track/providers/search_city_provider.dart';
import 'package:weather_track/providers/weather_provider.dart';

class WeatherAppProviders extends StatelessWidget {
  final Widget child;
  const WeatherAppProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchCityProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => ForecastProvider()),
      ],
      child: child,
    );
  }
}
