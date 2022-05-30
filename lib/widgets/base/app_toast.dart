import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_finder/constants/app_colors.dart';

class AppToast extends StatefulWidget {
  const AppToast({Key? key, required this.favorite}) : super(key: key);

  final bool favorite;

  @override
  State<AppToast> createState() => _AppToastState();
}

class _AppToastState extends State<AppToast> {
  late String actionId, iconId;

  @override
  void initState() {
    super.initState();
    setActionIcon();
  }

  void setActionIcon() {
    actionId = widget.favorite ? 'favoritou' : 'desfavoritou';
    iconId = widget.favorite ? 'ativo' : 'inativo';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.blue4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Você $actionId esse jogo!",
              style: Theme.of(context).textTheme.bodyText1),
          SvgPicture.asset(
            'assets/img/icons/favorito-$iconId.svg',
            width: 24,
            height: 24,
            color: widget.favorite ? AppColors.red1 : AppColors.white1,
          ),
        ],
      ),
    );
  }
}
