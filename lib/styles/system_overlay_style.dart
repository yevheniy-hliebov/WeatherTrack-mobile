import 'package:flutter/services.dart';
import 'package:weather_track/utils/constants/constants.dart';

class SystemOverlayStyle {
  static SystemUiOverlayStyle getStyle() {
    return SystemUiOverlayStyle(
      statusBarColor: AppColors.statusBar,
      statusBarIconBrightness: AppColors.statusBarIconBrightness,
      systemNavigationBarColor: AppColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness:
          AppColors.systemNavigationBarIconBrightness,
    );
  }
}
