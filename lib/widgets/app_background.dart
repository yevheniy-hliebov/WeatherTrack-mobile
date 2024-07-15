import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.appBg),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: Sizes.blurValueXs,
          sigmaY: Sizes.blurValueXs,
        ),
        child: child,
      ),
    );
  }
}
