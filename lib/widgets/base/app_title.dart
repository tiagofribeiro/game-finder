import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '//  ',
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: AppColors.green1,
                ),
          ),
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}
