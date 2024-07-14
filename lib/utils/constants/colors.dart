import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF4F4F4);

  /// SystemOverlayColors
  static Color statusBar = Colors.black.withOpacity(0.5);
  static Brightness statusBarIconBrightness = Brightness.light;
  static Color? systemNavigationBarColor = Colors.grey[800];
  static Brightness systemNavigationBarIconBrightness = Brightness.light;

  static const Color scaffoldBackgroundColor = Color(0xB3FFFFFF);

  static const Color text = primary;
  static const Color inverseText = Color(0xFF242424);

  static const Color weatherIconBg = Color(0xFF2B2B2B);

  static const Color whiteBg = primary;

  static const Color border = primary;

  static const Color divider = Color(0x99F4F4F4);

  static const Color transparent = Colors.transparent;

  static Color splashColor = primary.withOpacity(0.35);

  /// For make glass background
  static Color glassBg = const Color(0xFF5C5C5C).withOpacity(0.45);
  static LinearGradient glassDradient = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.4),
      Colors.white.withOpacity(0.15),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
