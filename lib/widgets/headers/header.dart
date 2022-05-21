import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
          SvgPicture.asset(
            'assets/img/icons/logo-horizontal.svg',
            height: 22,
            width: 151,
          ),
          Image.asset('assets/img/login.png'),
        ],
      ),
    );
  }
}
