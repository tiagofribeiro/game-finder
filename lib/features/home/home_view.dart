import 'package:flutter/material.dart';
import 'package:game_finder/widgets/base/header.dart';
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
      shrinkWrap: true,
      children: [
        const Header(title: 'home'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HorizontalList(
                title: 'novos jogos',
                subtitle: 'confira os lançamentos e o que vem por aí',
              ),
              HorizontalList(
                title: 'bem avaliados',
                subtitle: 'os melhores jogos de acordo com o Metacritic',
              ),
              VerticalList(
                  screen: 'home',
                ),
            ],
          ),
        ),
      ],
    );
  }
}
