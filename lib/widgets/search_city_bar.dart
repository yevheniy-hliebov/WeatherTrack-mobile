import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/models/city.dart';
import 'package:weather_track/providers/forecast_provider.dart';
import 'package:weather_track/providers/search_city_provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
import 'package:weather_track/widgets/common/common.dart';

class SearchCityBar extends StatefulWidget {
  const SearchCityBar({super.key});

  @override
  State<SearchCityBar> createState() => _SearchCityBarState();
}

class _SearchCityBarState extends State<SearchCityBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchCityProvider searchCityProvider =
        Provider.of<SearchCityProvider>(context);
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    ForecastProvider forecastProvider = Provider.of<ForecastProvider>(context);

    return CustomSearchBar(
      controller: _controller,
      hintText: 'Enter city...',
      isLoading: searchCityProvider.isLoading,
      separatorResultBuilder: (context, index) => const CustomDivider(),
      itemResultBuilder: (context, index) =>
          _buildItemResult(searchCityProvider.listCities[index]),
      resultCount: searchCityProvider.resultCount,
      onFocused: () => _handleOnFocused(searchCityProvider),
      onTapedItemResult: (index) {
        _controller.text = searchCityProvider.listCities[index].name;
        weatherProvider.selectCity(searchCityProvider.listCities[index]);
        forecastProvider.selectDay(0);
      },
      onChangeInputText: searchCityProvider.searchCities,
    );
  }

  void _handleOnFocused(SearchCityProvider provider) {
    if (_controller.text.isEmpty) {
      provider.searchDefaultCities();
    }
  }

  Widget _buildItemResult(City city) {
    return ListTile(
      title: Text(
        city.nameAndCountryCode,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
