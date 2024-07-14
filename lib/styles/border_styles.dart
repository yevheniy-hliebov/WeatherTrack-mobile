import 'package:flutter/material.dart';
import 'package:weather_track/utils/constants/constants.dart';

class BorderStyles {
  static Border get defaultBorder {
    return Border.all(
      color: AppColors.border,
      width: Sizes.containerBorderWidth,
      strokeAlign: BorderSide.strokeAlignInside,
    );
  }

  static Border get transparent {
    return Border.all(
      color: AppColors.transparent,
      width: Sizes.containerBorderWidth,
      strokeAlign: BorderSide.strokeAlignInside,
    );
  }
}
