import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);

    if (weatherProvider.selectedCity == null) {
      return const SizedBox(
        width: double.infinity,
      );
    }

    return CustomContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(Sizes.lg),
      border: BorderStyles.defaultBorder,
      child: Column(
        children: [
          _buildCityTitle(weatherProvider.selectedCity!.nameAndCountryCode),
          const SizedBox(height: Sizes.defaultSpace),
          _buildTabButtons(weatherProvider),
          const SizedBox(height: Sizes.spaceBtwSections),
          _buildBody(weatherProvider),
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

  Widget _buildTabButtons(WeatherProvider weatherProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabButton(
          text: 'Current',
          isActive: weatherProvider.isCurrentWeather,
          onTap: () {
            weatherProvider.selectWeatherInfoType(WeatherInfoType.current);
          },
        ),
        const SizedBox(width: Sizes.defaultSpace),
        TabButton(
          text: 'Forecast',
          isActive: weatherProvider.isForecastWeather,
          onTap: () {
            weatherProvider.selectWeatherInfoType(WeatherInfoType.forecast);
          },
        ),
      ],
    );
  }

  Widget _buildBody(WeatherProvider weatherProvider) {
    if (weatherProvider.isLoading) {
      return const Center(
        child: Loader(
          color: AppColors.primary,
        ),
      );
    }

    if (weatherProvider.isCurrentWeather &&
        weatherProvider.currentWeather != null) {
      return CurrentWeather(currentWeather: weatherProvider.currentWeather!);
    } else if (weatherProvider.isForecastWeather &&
        weatherProvider.forecast != null) {
      return const SizedBox();
    } else {
      return const Center(
        child: Text('Not found'),
      );
    }
  }
}
