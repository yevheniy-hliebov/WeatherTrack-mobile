import 'package:flutter/material.dart';
import 'package:weather_track/styles/app_text_styles.dart';

class AppTitle extends StatelessWidget {
  final String title;

  const AppTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTextStyles.appTitle,
      ),
    );
  }
}
