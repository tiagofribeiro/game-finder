import 'package:flutter/material.dart';
import 'package:game_finder/widgets/base/header.dart';
import 'package:game_finder/widgets/inputs/search_bar.dart';
import 'package:game_finder/widgets/lists/vertical_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _searchRequested = false;
  late String searchQuery;

  void searchGames(String query) {
    setState(() {
      _searchRequested = true;
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(title: 'busca'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: SearchBar(
                    onSearch: searchGames,
                  ),
                ),
                const SizedBox(height: 20),
                if (_searchRequested) ...[
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        VerticalList(
                          screen: 'busca',
                          query: searchQuery,
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
