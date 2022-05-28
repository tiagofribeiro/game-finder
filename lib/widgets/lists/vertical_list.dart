import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_finder/services/app_services.dart';
import 'package:game_finder/widgets/base/app_title.dart';
import 'package:game_finder/widgets/buttons/filters.dart';
import 'package:game_finder/widgets/cards/vertical_card.dart';

import '../../constants/app_colors.dart';
import '../../models/game_list_model.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key, required this.screen, this.query})
      : super(key: key);

  final String screen;
  final String? query;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  late List _games;
  // late String _order;
  // late String _filter;

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
          if (widget.screen == 'home') ...[
            const AppTitle(title: 'todos os jogos'),
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
              children: [
                Expanded(
                  child: Filters(
                    title: 'ordenar',
                    orderList: applyOrder,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Filters(
                    title: 'filtrar',
                    filterList: applyFilter,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          FutureBuilder<GameList>(
            future: widget.screen == 'home'
                ? AppServices().fetchGameList()
                : AppServices().fetchGameList(widget.query ?? ''),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.green1),
                );
              } else if (snapshot.connectionState == ConnectionState.none ||
                  snapshot.hasData == false) {
                return const Text('nao deu :(');
              } else {
                if (snapshot.data!.count != 0) {
                  _games = snapshot.data!.results!;

                  return SizedBox(
                      child: ListView.builder(
                    physics: widget.screen == 'home'
                        ? const NeverScrollableScrollPhysics()
                        : const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _games.length,
                    itemBuilder: (context, index) {
                      return VerticalCard(
                        title: _games[index].name,
                        img: _games[index].backgroundImage,
                        metascore: _games[index].metacritic,
                        released: _games[index].released ?? '',
                        platforms: _games[index].parentPlatforms,
                      );
                    },
                  ));
                } else {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/img/empty_state/ghost-pixel.svg'),
                          const SizedBox(height: 24),
                          Text(
                            'Não foi possível encontrar jogos com este nome',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: AppColors.blue5,
                                    ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Busque outro termo e tente novamente',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.blue5,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            }),
          )
        ],
      ),
    );
  }

  void applyOrder(String order) {}

  void applyFilter(String filter) {}
}
