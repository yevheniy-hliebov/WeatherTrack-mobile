import 'package:flutter/material.dart';
import 'package:weather_track/config/app_colors.dart';

class AppTextStyles {
  static TextStyle get appTitle {
    return const TextStyle(
      color: AppColors.textColor,
      fontSize: 22,
      height: 1.5,
    );
  }

  static TextStyle get searchTextHint {
    return TextStyle(
      color: AppColors.textColor.withOpacity(0.6),
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 2,
    );
  }

  static TextStyle get searchText {
    return const TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 2,
      decoration: TextDecoration.none,
      decorationThickness: 0,
    );
  }
}
