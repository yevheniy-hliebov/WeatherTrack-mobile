import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double size;
  final double strokeWidth;
  final EdgeInsets padding;

  const Loader({
    super.key,
    this.color = Colors.black,
    this.size = Sizes.loaderSize,
    this.strokeWidth = Sizes.loaderStrokeWidth,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
