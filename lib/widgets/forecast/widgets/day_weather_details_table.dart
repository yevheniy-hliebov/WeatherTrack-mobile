import 'package:flutter/material.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/utils/helper_functions.dart';
import 'package:weather_track/widgets/current-weather/widgets/weather_icon.dart';
import 'package:weather_track/widgets/forecast/widgets/detail_table_cell.dart';
import 'package:weather_track/widgets/forecast/widgets/detail_table_header.dart';

class DayWeatherDetailsTable extends StatelessWidget {
  final List<Weather> forecast;

  const DayWeatherDetailsTable({
    super.key,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildHoursColumn(context),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildTableHeader(),
                const SizedBox(height: Sizes.defaultSpace),
                ..._buildWeatherRows(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildHoursColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 74, right: 10),
      child: Column(
        children: forecast.map((weather) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              HelperFunctions.formatDate(
                date: weather.dtTxt,
                newPattern: 'HH:mm',
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTableHeader() {
    return const Row(
      children: [
        SizedBox(width: 40),
        DetailTableHeader(value: 'Temp,\n°C'),
        DetailTableHeader(value: 'Feels\nlike'),
        DetailTableHeader(value: 'Humidity\n%'),
        DetailTableHeader(value: 'Pressure,\nhPa'),
        DetailTableHeader(value: 'Wind\nspeed'),
        DetailTableHeader(value: 'Rain\nvol 3h'),
      ],
    );
  }

  List<Widget> _buildWeatherRows() {
    return forecast.map((weather) {
      return Column(
        children: [
          Row(
            children: [
              WeatherIcon(conditionIconName: weather.condition.icon),
              DetailTableCell(value: weather.temperature.currentString),
              DetailTableCell(value: weather.temperature.feelsLikeString),
              DetailTableCell(value: weather.humidity.toString()),
              DetailTableCell(value: weather.pressure.current.toString()),
              DetailTableCell(value: weather.wind.speed.toString()),
              DetailTableCell(value: '${weather.rain3h ?? '0'}'),
            ],
          ),
          const SizedBox(height: Sizes.xs),
        ],
      );
    }).toList();
  }
}
