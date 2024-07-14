import 'package:flutter/material.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/current-weather/widgets/detail_tile.dart';

class DetailsGrid extends StatelessWidget {
  final Weather currentWeather;

  const DetailsGrid({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailTile(
              value: '${currentWeather.clouds}%',
              label: 'Cloud',
            ),
            DetailTile(
              value: '${currentWeather.humidity}%',
              label: 'Humidity',
            ),
            DetailTile(
              value: '${currentWeather.wind.speed}m/s',
              label: 'Wind speed',
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailTile(
              value: currentWeather.wind.direction,
              label: 'Wind direction',
            ),
            DetailTile(
              value: '${currentWeather.pressure.current}hPa',
              label: 'Pressure',
            ),
            DetailTile(
              value: '${currentWeather.rain3h ?? 0}mm',
              label: 'Rain vol 3h',
            ),
          ],
        ),
      ],
    );
  }
}
