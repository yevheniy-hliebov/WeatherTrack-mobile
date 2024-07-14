import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/search_city_provider.dart';
import 'package:weather_track/styles/system_overlay_style.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/common/common.dart';
import 'package:weather_track/widgets/search_city_bar.dart';
import 'package:weather_track/widgets/weather_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchCityProvider(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.appBg),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: Sizes.blurValueXs, sigmaY: Sizes.blurValueXs),
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: AppBar(
              backgroundColor: AppColors.transparent,
              systemOverlayStyle: SystemOverlayStyle.getStyle(),
              title: const AppTitle(title: 'WeatherTrack'),
            ),
            body: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Sizes.md),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Sizes.customSearchBarHeight + Sizes.sm),
                      child: Column(
                        children: [
                          WeatherContainer(),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: SearchCityBar(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
