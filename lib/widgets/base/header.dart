import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_finder/widgets/base/app_title.dart';

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
            AppTitle(title: title)
          ],
          Image.asset('assets/img/login.png'),
        ],
      ),
    );
  }
}
