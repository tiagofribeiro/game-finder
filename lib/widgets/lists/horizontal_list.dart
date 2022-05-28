import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/game_list_model.dart';
import '../../services/app_services.dart';
import '../base/app_title.dart';
import '../cards/horizontal_card.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
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
          AppTitle(title: widget.title),
          const SizedBox(
            height: 10,
          ),
          Text(widget.subtitle,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.blue5,
                  )),
          const SizedBox(
            height: 24,
          ),
          FutureBuilder<GameList>(
              future: widget.title == 'novos jogos'
                  ? AppServices().fetchNewGamesList(20)
                  : AppServices().fetchBestGamesList(20),
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
                    List editedList = snapshot.data!.results!
                      ..removeRange(0, 2);
                    _games = editedList;
                  }
                  return SizedBox(
                      height: 275,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _games.length,
                        itemBuilder: (context, index) {
                          return HorizontalCard(
                            title: _games[index].name,
                            img: _games[index].backgroundImage,
                            metascore: _games[index].metacritic,
                            released: _games[index].released ?? '',
                            platforms: _games[index].parentPlatforms,
                          );
                        },
                      ));
                }
              })),
        ],
      ),
    );
  }
}
