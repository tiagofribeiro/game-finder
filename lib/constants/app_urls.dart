import 'dart:ui';
import 'package:flutter/material.dart';

class AppUrls {
  static String baseUrl = 'https://api.rawg.io/api';
  static String key = '8fba6144c7f94f1283d663001c4eb1d3';

  static String games = '$baseUrl/games';
  static String gamesAll = '$baseUrl/games?page=1&page_size=';

  static String platforms = '$baseUrl/platforms/lists/parents?ordering=id';
}
