import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 67,
      width: double.maxFinite,
      decoration:  const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(title == 'home') ...[
          SvgPicture.asset(
            'assets/img/icons/logo-horizontal.svg',
            height: 22,
            width: 151,
          ),
          ]
          else ...[
            RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '//  ',
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: AppColors.green1,),
                ),
                TextSpan(
                  text: title,
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          ],
          Image.asset('assets/img/login.png'),
        ],
      ),
    );
  }
}
