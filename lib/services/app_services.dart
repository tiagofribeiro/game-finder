import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:game_finder/constants/app_urls.dart';

import '../models/game_list_model.dart';

class AppServices {
  final dio = Dio();

  Future<GameList> fetchGameList() async {
    final response =
        await dio.get('${AppUrls.gamesAll}50', queryParameters: {'key': AppUrls.key});
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  Future<GameList> fetchNewGamesList() async {
    final response =
        await dio.get('${AppUrls.gamesAll}20', queryParameters: {
          'key': AppUrls.key,
          'ordering':'-released',
          'platforms':'187,186'
          });
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  Future<GameList> fetchBestGamesList() async {
    final response =
        await dio.get('${AppUrls.gamesAll}20', queryParameters: {
          'key': AppUrls.key,
          'ordering':'-metacritic',
          });
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }


}
