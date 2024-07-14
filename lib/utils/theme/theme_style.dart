import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class ThemeStyle {
  ThemeStyle._();

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: const TextStyle().copyWith(color: AppColors.text),
      titleMedium: const TextStyle().copyWith(color: AppColors.text),
      headlineMedium: const TextStyle().copyWith(color: AppColors.text),
      displayLarge: const TextStyle().copyWith(
        color: AppColors.text,
        fontSize: Sizes.displayLargeSize,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: const TextStyle().copyWith(color: AppColors.text, height: 2),
      labelLarge: const TextStyle().copyWith(color: AppColors.text),
      labelMedium: const TextStyle().copyWith(color: AppColors.text),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.text,
      selectionHandleColor: AppColors.text,
    ),
  );
}
