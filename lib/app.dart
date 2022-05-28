import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_finder/constants/app_theme.dart';
import 'package:game_finder/features/home/home_view.dart';
import 'package:game_finder/features/search/search_view.dart';
import 'package:game_finder/features/favorites/favorites_view.dart';
import 'package:game_finder/widgets/base/background.dart';

import 'constants/app_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstView(),
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  int _selectedPageIndex = 1;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  void onBottomTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 800), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Background(
        content: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(          
              selectedFontSize: 1,
              unselectedFontSize: 1,
              enableFeedback: false,
              elevation: 0.0,
              currentIndex: _selectedPageIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: AppColors.blue3,
              onTap: onBottomTapped,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/img/icons/busca.svg',
                        height: 24, width: 24, color: AppColors.blue5),
                    activeIcon: SvgPicture.asset('assets/img/icons/busca.svg',
                        height: 24, width: 24, color: AppColors.green1),
                    label: 'busca'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/img/icons/game.svg',
                        height: 24, width: 24, color: AppColors.blue5),
                    activeIcon: SvgPicture.asset('assets/img/icons/game.svg',
                        height: 24, width: 24, color: AppColors.green1),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/img/icons/favorito-ativo.svg',
                        height: 24, width: 24, color: AppColors.blue5),
                    activeIcon: SvgPicture.asset(
                        'assets/img/icons/favorito-ativo.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.green1),
                    label: 'favs'),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: PageView(
              controller: pageController,
              onPageChanged: (page) {
                setState(() {
                  _selectedPageIndex = page;
                });
              },
              children: const [
                SearchView(),
                HomeView(),
                FavoritesView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
