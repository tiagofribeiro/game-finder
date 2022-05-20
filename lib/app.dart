import 'package:flutter/material.dart';
import 'package:game_finder/constants/app_theme.dart';
import 'package:game_finder/features/home/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}