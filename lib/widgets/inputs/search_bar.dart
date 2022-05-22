import 'package:flutter/material.dart';
import 'package:game_finder/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.green1,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.blue2,
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: SvgPicture.asset('assets/img/icons/busca.svg',
              color: AppColors.green1),
          onPressed: () {
            setState(() {
              print('Teste');
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent)),
        hintText: 'Buscar um jogo',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColors.blue5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
