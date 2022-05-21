
import 'package:flutter/material.dart';

import 'app_colors.dart';


final mainTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 64,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColors.white1,
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      color: AppColors.white1,
      fontSize: 16,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w800,
    ),
    bodyText1: TextStyle(
      color: AppColors.white1,
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: AppColors.white1,
      fontSize: 12,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w800,
    ),
  ),
);
