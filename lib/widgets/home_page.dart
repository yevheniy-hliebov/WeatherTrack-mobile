import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/search_city_provider.dart';
import 'package:weather_track/styles/system_overlay_style.dart';
import 'package:weather_track/widgets/common/common.dart';
import 'package:weather_track/widgets/search_city_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchCityProvider(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemOverlayStyle.getStyle(),
              title: const AppTitle(title: 'WeatherTrack'),
            ),
            body: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SearchCityBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
