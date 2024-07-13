import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/config/app_colors.dart';
import 'package:weather_track/models/city.dart';
import 'package:weather_track/providers/search_city_provider.dart';
import 'package:weather_track/widgets/custom_search_bar.dart';

class SearchCityBar extends StatefulWidget {
  const SearchCityBar({super.key});

  @override
  State<SearchCityBar> createState() => _SearchCityBarState();
}

class _SearchCityBarState extends State<SearchCityBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchCityProvider provider = Provider.of<SearchCityProvider>(context);

    return CustomSearchBar(
      controller: _controller,
      hintText: 'Enter city...',
      isLoading: provider.isLoading,
      separatorResultBuilder: (context, index) => const Divider(height: 1),
      itemResultBuilder: (context, index) => _buildItemResult(provider.listCities[index]),
      resultCount: provider.resultCount,
      onFocused: () => _handleOnFocused(provider),
      onTapedItemResult: (index) => _handleOnTapedItemResult(provider, index),
      onChangeInputText: provider.searchCities,
    );
  }

  void _handleOnFocused(SearchCityProvider provider) {
    if (_controller.text.isEmpty) {
      provider.searchDefaultCities();
    }
  }

  void _handleOnTapedItemResult(SearchCityProvider provider, int index) {
    _controller.text = provider.listCities[index].name;
    provider.selectCity(index);
  }

  Widget _buildItemResult(City city) {
    return ListTile(
      title: Text(
        city.nameAndCountryCode,
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
