import 'package:flutter/material.dart';
import 'package:game_finder/constants/app_colors.dart';
import 'package:game_finder/widgets/header.dart';
import 'package:game_finder/widgets/horizontal_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, -1.1),
          radius: 1,
          colors: [AppColors.blue3, AppColors.blue1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Header(),
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
                    subtitle: 'os melhores jogos de acordo com o Metacritic',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
