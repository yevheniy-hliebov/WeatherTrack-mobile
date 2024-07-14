import 'package:flutter/material.dart';
import 'package:weather_track/styles/border_styles.dart';
import 'package:weather_track/utils/constants/constants.dart';

class TabButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final void Function()? onTap;

  const TabButton({
    super.key,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isActive && onTap != null) {
          onTap?.call();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(Sizes.sm),
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: Sizes.tabButtonWidth,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.whiteBg : AppColors.transparent,
          borderRadius: BorderRadius.circular(Sizes.tabButtonRadius),
          border: BorderStyles.defaultBorder,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isActive ? AppColors.inverseText : AppColors.text,
                ),
          ),
        ),
      ),
    );
  }
}
