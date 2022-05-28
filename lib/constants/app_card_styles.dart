import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppCardStyles {
  static BoxDecoration gradientBorder = BoxDecoration(
    gradient: const RadialGradient(
      center: Alignment(1, 1),
      radius: 1.1,
      colors: [Color(0xff567899), Color(0xff334960)],
    ),
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration innerDecoration = BoxDecoration(
    color: AppColors.blue3,
    borderRadius: BorderRadius.circular(12),
  );
}
