import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final double? width;
  final Widget? child;

  final double radius = Sizes.containerRadiusLg;
  final double blurValue = Sizes.blurValueSm;

  const CustomContainer({
    super.key,
    this.padding,
    this.border,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurValue,
          sigmaY: blurValue,
        ),
        child: Container(
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.glassBg,
            gradient: AppColors.glassDradient,
            borderRadius: BorderRadius.circular(radius),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
