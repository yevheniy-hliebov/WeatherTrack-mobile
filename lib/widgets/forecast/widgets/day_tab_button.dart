import 'package:flutter/material.dart';
import 'package:weather_track/styles/border_styles.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/utils/helper_functions.dart';

class DayTabButton extends StatelessWidget {
  final DateTime date;
  final bool isActive;
  final Function()? onTap;

  const DayTabButton({
    super.key,
    required this.date,
    this.isActive = false,
    this.onTap,
  });

  static const borderRadius = BorderRadius.all(
    Radius.circular(Sizes.containerRadiusSm),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.splashColor,
        borderRadius: borderRadius,
        child: _buildContainer(context),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.sm,
        horizontal: Sizes.xs,
      ),
      width: Sizes.dayTabButtonWidth,
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: BorderStyles.defaultBorder,
        borderRadius: borderRadius,
      ),
      child: _buildTextColumn(context),
    );
  }

  Column _buildTextColumn(BuildContext context) {
    return Column(
      children: [
        _buildDayOfWeekText(context),
        _buildDateText(context),
      ],
    );
  }

  Text _buildDayOfWeekText(BuildContext context) {
    return Text(
      HelperFunctions.formatDate(date: date, newPattern: 'EEEE'),
      style: _dayOfWeekTextStyle(context),
    );
  }

  Text _buildDateText(BuildContext context) {
    return Text(
      HelperFunctions.formatDate(date: date, newPattern: 'dd.MM.yy'),
      style: _dateTextStyle(context),
    );
  }

  TextStyle? _dayOfWeekTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(color: _textColor);
  }

  TextStyle? _dateTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(color: _textColor);
  }

  Color get _backgroundColor =>
      isActive ? AppColors.whiteBg : AppColors.transparent;

  Color get _textColor => isActive ? AppColors.inverseText : AppColors.text;
}
