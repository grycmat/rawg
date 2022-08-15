import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/services/http.service.dart';

@singleton
class GameProvider {
  List<Game> _games = [];

  Future<List<Game>> getGames() =>
      _games.isEmpty ? _loadGames() : Future.value(_games);

  Future<List<Game>> _loadGames() async {
    final response = await HttpService.fetchGames();
    final games = ApiResponse.fromMap(response.data);

    _games = games.results ?? [];

    return _games;
  }
}
