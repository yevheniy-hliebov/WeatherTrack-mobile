import 'package:flutter/material.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/common/common.dart';
import 'package:weather_track/widgets/current-weather/widgets/details_grid.dart';
import 'package:weather_track/widgets/current-weather/widgets/last_update_text.dart';
import 'package:weather_track/widgets/current-weather/widgets/weather_icon.dart';

class CurrentWeather extends StatelessWidget {
  final Weather currentWeather;

  const CurrentWeather({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentWeather.temperature.currentString,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(width: Sizes.spaceBtwSections),
            Text(
              'Feels like:\n${currentWeather.temperature.feelsLikeString}C',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherIcon(conditionIconName: currentWeather.condition.icon),
            const SizedBox(width: Sizes.defaultSpace),
            Flexible(
              child: Text(
                currentWeather.condition.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        const CustomDivider(),
        const SizedBox(height: Sizes.defaultSpace),
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: Sizes.defaultSpace),
        DetailsGrid(currentWeather: currentWeather),
        const SizedBox(height: Sizes.spaceBtwSections),
        LastUpdateText(unixDate: currentWeather.unixDate),
      ],
    );
  }
}
