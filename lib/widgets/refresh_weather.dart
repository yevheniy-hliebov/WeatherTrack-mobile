import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/forecast_provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
import 'package:weather_track/utils/constants/constants.dart';

class RefreshWeather extends StatefulWidget {
  final Widget child;
  const RefreshWeather({
    super.key,
    required this.child,
  });

  @override
  State<RefreshWeather> createState() => _RefreshWeatherState();
}

class _RefreshWeatherState extends State<RefreshWeather> {
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    ForecastProvider forecastProvider = Provider.of<ForecastProvider>(context);

    if (weatherProvider.selectedCity == null) {
      return widget.child;
    }

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      backgroundColor: AppColors.whiteBg,
      color: AppColors.onPrimary,
      displacement: Sizes.xs,
      semanticsLabel: 'Update Weather in City',
      onRefresh: () async {
        _updateWeather(weatherProvider, forecastProvider);
      },
      child: widget.child,
    );
  }

  void _updateWeather(WeatherProvider weatherProvider, ForecastProvider forecastProvider) {
    if (weatherProvider.selectedCity != null) {
      weatherProvider.getWeather();
      forecastProvider.selectDay(0);
    }
  }
}
