import 'package:flutter/material.dart';
import 'package:game_finder/widgets/base/header.dart';
import 'package:game_finder/widgets/cards/vertical_card.dart';
import 'package:game_finder/widgets/inputs/search_bar.dart';

import '../../constants/app_colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: 'busca'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SearchBar(),
                SizedBox(height: 20),
                Expanded(
                    child: ListView(
                  children: [
                    // VerticalCard(),
                    // VerticalCard(),
                    // VerticalCard(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
