import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemOverlayStyle {
  static SystemUiOverlayStyle getStyle() {
    return SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.5),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey[800],
        systemNavigationBarIconBrightness: Brightness.light);
  }
}
