import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'horizontal_card.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '//  ',
                  style: TextStyle(
                    color: AppColors.green1,
                    fontSize: 20,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: AppColors.blue5,
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 277,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HorizontalCard(),
                HorizontalCard(),
                HorizontalCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
