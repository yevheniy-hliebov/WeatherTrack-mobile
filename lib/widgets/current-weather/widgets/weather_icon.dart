import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_track/utils/constants/constants.dart';

class WeatherIcon extends StatelessWidget {
  final String conditionIconName;

  const WeatherIcon({
    super.key,
    required this.conditionIconName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.weatherIconBg,
        borderRadius: BorderRadius.circular(Sizes.containerRadiusSm),
      ),
      padding: const EdgeInsets.all(Sizes.xs),
      child: SvgPicture.asset(
        WeatherIcons.getIconByName(conditionIconName),
      ),
    );
  }
}
