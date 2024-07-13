import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double size;
  final double strokeWidth;
  final EdgeInsets padding;

  const Loader({
    super.key,
    this.color = Colors.black,
    this.size = 35,
    this.strokeWidth = 3,
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
