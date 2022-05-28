import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_card_styles.dart';
import '../../models/platforms_model.dart';
import '../../utilities/app_functions.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    Key? key,
    required this.title,
    required this.released,
    required this.platforms,
    required this.metascore,
    required this.img,
  }) : super(key: key);

  final int? metascore;
  final String? img;
  final List<ParentPlatforms>? platforms;
  final String? title;
  final String? released;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      margin: const EdgeInsets.only(right: 20),
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
                  height: 140,
                  child: Image.network(
                    img ?? '',
                    errorBuilder: ((context, error, stackTrace) {
                      return Image.asset(
                        'assets/img/game_placeholder.png',
                        fit: BoxFit.cover,
                      );
                    }),
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.green1,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null));
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  for (String svg in AppFunctions.setPlatformIcons(
                                      platforms!)) ...[
                                    SvgPicture.asset(
                                      svg,
                                      height: 17,
                                      width: 17,
                                    ),
                                    const SizedBox(width: 8)
                                  ]
                                ],
                              ),
                              if (metascore != null) ...[
                                Container(
                                  alignment: Alignment.center,
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: metascore! >= 75
                                            ? AppColors.green1
                                            : metascore! >= 50
                                                ? AppColors.yellow1
                                                : AppColors.red1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Text(metascore.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                                color: metascore! >= 75
                                                    ? AppColors.green1
                                                    : metascore! >= 50
                                                        ? AppColors.yellow1
                                                        : AppColors.red1)),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title ?? '?',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(released == '' ? 'TBA' : released!.substring(0,4),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.blue5,
                                    )),
                      ],
                    ),
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
