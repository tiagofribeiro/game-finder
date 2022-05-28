import 'package:flutter/material.dart';

import '../../widgets/base/header.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _SearchViewState();
}

class _SearchViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Header(title: 'favoritos'),
        // Container(color: AppColors.blue3, height: 50,)
      ],
    );
  }
}