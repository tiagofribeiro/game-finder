import 'package:flutter/material.dart';
import 'package:game_finder/services/app_services.dart';
import 'package:game_finder/widgets/buttons/filters.dart';
import 'package:game_finder/widgets/cards/vertical_card.dart';

import '../../constants/app_colors.dart';
import '../../models/game_list_model.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key, required this.screen}) : super(key: key);

  final String screen;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  late List _games;

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
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: AppColors.green1,
                        )),
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
          Text('mais de 700 mil jogos pra consultar',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.blue5,
                  )),
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
          FutureBuilder<GameList>(
              future: AppServices().fetchGameList(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.green1),
                  );
                } else if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.hasData == false) {
                  return const Text('nao deu :(');
                } else {
                  if (snapshot.hasData) {
                    _games = snapshot.data!.results!;
                  }
                  return SizedBox(
                    height: 350,
                    child: ListView(
                      children: _games.map((game) {
                        return VerticalCard(
                          title: game.name,
                          img: game.backgroundImage,
                          metascore: game.metacritic,
                          released: game.released ?? '',
                          platforms: game.parentPlatforms,
                        );
                      }).toList(),
                    ),
                  );
                }
              }))
        ],
      ),
    );
  }
}
