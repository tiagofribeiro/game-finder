import 'package:flutter/material.dart';
import 'package:game_finder/constants/app_colors.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment(1, 1),
          radius: 1,
          colors: [Color(0xff567899), Color(0xff334960)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.blue3,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Image.asset('assets/img/sonico.png'),
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
                        'Sonic Frontiers',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        '2022',
                        style: TextStyle(
                          color: AppColors.blue5,
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
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
