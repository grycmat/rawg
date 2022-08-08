import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/services/http.service.dart';

class GameProvider {
  List<Game>? _games;

  Future<List<Game>> getGames() async {
    if (_games == null) {
      return loadGames();
    }
    return Future.value(_games);
  }

  Future<List<Game>> loadGames() async {
    final response = await HttpService.getGames();
    final games = ApiResponse.fromMap(response.data);

    _games = games.results ?? List<Game>.empty();
    return _games as List<Game>;
  }
}
