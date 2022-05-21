import 'package:flutter/material.dart';
import 'package:game_finder/widgets/headers/header.dart';
import 'package:game_finder/widgets/lists/horizontal_list.dart';
import 'package:game_finder/widgets/lists/vertical_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return ListView(
              children: [
                const Header(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      HorizontalList(
                        title: 'novos jogos',
                        subtitle: 'confira os recém-lançamentos do mercado',
                      ),
                      HorizontalList(
                        title: 'bem avaliados',
                        subtitle:
                            'os melhores jogos de acordo com o Metacritic',
                      ),
                      VerticalList(),
                    ],
                  ),
                ),
              ],
            );
  }
}
