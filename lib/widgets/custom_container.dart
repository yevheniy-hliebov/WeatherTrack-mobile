import 'dart:ui';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final double? width;
  final Widget? child;

  final double radius = 25;
  final double blurValue = 1;

  const CustomContainer({
    super.key,
    this.padding,
    this.border,
    this.width,
    this.child,
  });

  static Border get defaultBorder {
    return Border.all(
      color: Colors.white,
      width: 1,
      strokeAlign: BorderSide.strokeAlignInside,
    );
  }

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
            color: Colors.black.withOpacity(0.25),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.15),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(radius),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
