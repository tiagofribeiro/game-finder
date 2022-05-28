import 'package:flutter/material.dart';
import 'package:game_finder/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  final Function(String) onSearch;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChange);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _focusNode.requestFocus());
  }

  onFocusChange() {
    setState(() {
      if (_focusNode.hasFocus) {
        _focused = true;
      } else {
        _focused = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      focusNode: _focusNode,
      controller: searchController,
      cursorColor: AppColors.green1,
      style: Theme.of(context).textTheme.bodyText1,
      onSubmitted: (text) {
        widget.onSearch(text);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.blue2,
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: SvgPicture.asset('assets/img/icons/busca.svg',
              color: _focused ? AppColors.green1 : AppColors.blue5),
          onPressed: () {
            setState(() {
              widget.onSearch(searchController.text);
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.white1)),
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
