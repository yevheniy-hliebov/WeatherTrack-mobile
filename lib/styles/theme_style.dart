import 'package:flutter/material.dart';
import 'package:weather_track/config/app_colors.dart';

class ThemeStyle {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 84, 76, 97),
      ),
      useMaterial3: true,
    );
  }
}
