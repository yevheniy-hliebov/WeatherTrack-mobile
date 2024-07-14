import 'package:flutter/material.dart';
import 'package:weather_track/utils/theme/theme_style.dart';
import 'package:weather_track/widgets/home_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherTrack',
      theme: ThemeStyle.defaultTheme,
      home: const HomePage(),
    );
  }
}
