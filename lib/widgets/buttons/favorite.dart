import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_finder/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with TickerProviderStateMixin {
  bool _isFavorite = false;
  bool _isAnimating = false;

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isFavorite = true;
            _isAnimating = false;
          });
        }
      });
  }

  Widget setFavoriteState() {
    if (!_isAnimating) {
      if (_isFavorite) {
        return SvgPicture.asset(
          'assets/img/icons/favorito-ativo.svg',
          color: AppColors.red1,
          width: 18,
          height: 18,
        );
      } else {
        return Image.asset(
          'assets/img/icons/favorito-inativo.png',
          width: 18,
          height: 18,
        );
      }
    } else {
      return Lottie.asset(
        'assets/img/animation/favorite.json',
        width: 40,
        height: 40,
        fit: BoxFit.fill,
        controller: _animationController,
        onLoaded: (composition) {
          setState(
            () {
              _isAnimating = true;
              _animationController
                ..duration = composition.duration
                ..reset()
                ..forward();
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              _isAnimating = true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    color: const Color.fromRGBO(106, 138, 166, 0.4),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              setFavoriteState(),
            ],
          ),
        ),
      ),
    );
  }
}
