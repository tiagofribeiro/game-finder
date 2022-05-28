import 'package:dio/dio.dart';
import 'package:game_finder/constants/app_urls.dart';

import '../models/game_list_model.dart';

class AppServices {
  final dio = Dio();

  Future<GameList> fetchGameList([String query = '']) async {
    Map<String, dynamic> parameters = {'key': AppUrls.key};
    if (query.isNotEmpty) {
      parameters.addAll({'search': query});
    }

    final response =
        await dio.get('${AppUrls.gamesAll}50', queryParameters: parameters);
        
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  Future<GameList> fetchAlphabeticalGamesList() async {
    final response = await dio.get('${AppUrls.gamesAll}50', queryParameters: {
      'key': AppUrls.key,
      'ordering': 'name',
    });
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  Future<GameList> fetchNewGamesList(int pageSize) async {
    final response = await dio.get(AppUrls.gamesAll + pageSize.toString(),
        queryParameters: {
          'key': AppUrls.key,
          'ordering': '-released',
          'platforms': '187,186'
        });
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  Future<GameList> fetchBestGamesList(int pageSize) async {
    final response =
        await dio.get(AppUrls.gamesAll + pageSize.toString(), queryParameters: {
      'key': AppUrls.key,
      'ordering': '-metacritic',
    });
    if (response.statusCode == 200) {
      final result = response.data;
      return GameList.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }
}
