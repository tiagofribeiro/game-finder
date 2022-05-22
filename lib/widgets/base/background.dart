import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, -1.1),
          radius: 1.5,
          colors: [AppColors.blue4, AppColors.blue1],
        ),
      ),
      child: content,
    );
  }
}