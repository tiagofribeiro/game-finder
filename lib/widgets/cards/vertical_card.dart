import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_card_styles.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: AppCardStyles.gradientBorder,
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: DecoratedBox(
          decoration: AppCardStyles.innerDecoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 180,
                  child:
                      Image.asset('assets/img/levadois.png', fit: BoxFit.cover),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("icones "),
                          Text("metacritic "),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'It Takes Two',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        '2021',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.blue5,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
