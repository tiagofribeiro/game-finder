import 'package:flutter/material.dart';
import 'package:game_finder/widgets/buttons/filters.dart';
import 'package:game_finder/widgets/cards/vertical_card.dart';

import '../../constants/app_colors.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
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
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: AppColors.green1,)
                ),
                TextSpan(
                  text: 'todos os jogos',
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'mais de 700 mil jogos pra consultar',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.blue5,)
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Expanded(
                child: Filters(
                  title: 'ordenar',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Filters(
                  title: 'filtrar',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 277,
            child: ListView(
              children: const [
                VerticalCard(),
                VerticalCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
