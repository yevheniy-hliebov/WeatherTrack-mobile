import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_track/models/weather.dart';
import 'package:weather_track/styles/border_styles.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/common/common.dart';
import 'package:weather_track/widgets/current-weather/current_weather.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({super.key});

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  bool _isCurrentWeather = true;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(Sizes.lg),
      border: BorderStyles.defaultBorder,
      child: Column(
        children: [
          _buildCityTitle('Kyiv, UA'),
          const SizedBox(height: Sizes.defaultSpace),
          _buildTabButtons(),
          const SizedBox(height: Sizes.spaceBtwSections),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildCityTitle(String cityName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Images.locationIcon),
        Text(
          cityName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget _buildTabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabButton(
          text: 'Current',
          isActive: _isCurrentWeather,
          onTap: onTapButton,
        ),
        const SizedBox(width: Sizes.defaultSpace),
        TabButton(
          text: 'Forecast',
          isActive: !_isCurrentWeather,
          onTap: onTapButton,
        ),
      ],
    );
  }

  void onTapButton() {
    setState(() => _isCurrentWeather = !_isCurrentWeather);
  }

  Widget _buildBody() {
    if (_isCurrentWeather) {
      return CurrentWeather(currentWeather: Weather.mockWeather);
    } else {
      return const SizedBox();
    }
  }
}
