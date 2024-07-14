import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/models/dayly_weather.dart';
import 'package:weather_track/providers/forecast_provider.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/forecast/widgets/day_tab_button.dart';

class DayTabButtons extends StatefulWidget {
  final List<DailyForecast> dailyForecast;

  const DayTabButtons({
    super.key,
    required this.dailyForecast,
  });

  @override
  State<DayTabButtons> createState() => _DayTabButtonsState();
}

class _DayTabButtonsState extends State<DayTabButtons> {
  @override
  Widget build(BuildContext context) {
    ForecastProvider forecastProvider = Provider.of<ForecastProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          for (int i = 0; i < widget.dailyForecast.length; i++) ...[
            DayTabButton(
              date: widget.dailyForecast[i].date,
              isActive: i == forecastProvider.currentDayTabIndex,
              onTap: () => forecastProvider.selectDay(i),
            ),
            if ((i - 1) < widget.dailyForecast.length)
              const SizedBox(width: Sizes.sm),
          ]
        ],
      ),
    );
  }
}
