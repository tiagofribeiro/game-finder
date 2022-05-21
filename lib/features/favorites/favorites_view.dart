import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _SearchViewState();
}

class _SearchViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.blue4,);
  }
}