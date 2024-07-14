import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.divider,
      height: Sizes.dividerHeight,
    );
  }
}
