import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/models/dayly_weather.dart';
import 'package:weather_track/providers/forecast_provider.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/common/common.dart';
import 'package:weather_track/widgets/forecast/widgets/day_tab_buttons.dart';
import 'package:weather_track/widgets/forecast/widgets/day_weather_details_table.dart';

class Forecast extends StatefulWidget {
  final List<DailyForecast> dailyForecast;

  const Forecast({
    super.key,
    required this.dailyForecast,
  });

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    ForecastProvider forecastProvider = Provider.of<ForecastProvider>(context);

    return Column(
      children: [
        DayTabButtons(dailyForecast: widget.dailyForecast),
        const SizedBox(height: Sizes.spaceBtwSections2),
        const CustomDivider(),
        const SizedBox(height: Sizes.spaceBtwSections2),
        DayWeatherDetailsTable(
          forecast: widget
              .dailyForecast[forecastProvider.currentDayTabIndex].forecast,
        ),
      ],
    );
  }
}
