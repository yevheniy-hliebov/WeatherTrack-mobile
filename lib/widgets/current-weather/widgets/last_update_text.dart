import 'package:flutter/material.dart';
import 'package:weather_track/utils/helper_functions.dart';

class LastUpdateText extends StatelessWidget {
  final int? unixDate;

  const LastUpdateText({
    super.key,
    required this.unixDate,
  });

  @override
  Widget build(BuildContext context) {
    if (unixDate == null) {
      return const SizedBox();
    }
    String formattedDate = HelperFunctions.unixDateToString(unixDate!, null);
    return Text('Last update: $formattedDate');
  }
}
