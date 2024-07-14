import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/models/city.dart';
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

    return CustomSearchBar(
      controller: _controller,
      hintText: 'Enter city...',
      isLoading: searchCityProvider.isLoading,
      separatorResultBuilder: (context, index) => const CustomDivider(),
      itemResultBuilder: (context, index) =>
          _buildItemResult(searchCityProvider.listCities[index]),
      resultCount: searchCityProvider.resultCount,
      onFocused: () => _handleOnFocused(searchCityProvider),
      onTapedItemResult: (index) => _handleOnTapedItemResult(
        searchCityProvider,
        weatherProvider,
        index,
      ),
      onChangeInputText: searchCityProvider.searchCities,
    );
  }

  void _handleOnFocused(SearchCityProvider provider) {
    if (_controller.text.isEmpty) {
      provider.searchDefaultCities();
    }
  }

  void _handleOnTapedItemResult(
      SearchCityProvider provider, WeatherProvider weatherProvider, int index) {
    _controller.text = provider.listCities[index].name;
    print('selected');
    weatherProvider.selectCity(provider.listCities[index]);
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
