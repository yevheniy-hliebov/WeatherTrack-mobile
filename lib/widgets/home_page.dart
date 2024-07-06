import 'package:flutter/material.dart';
import 'package:weather_track/styles/system_overlay_style.dart';
import 'package:weather_track/widgets/app_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemOverlayStyle.getStyle(),
          title: const AppTitle(title: 'WeatherTrack'),
        ),
        body: const Center(),
      ),
    );
  }
}
