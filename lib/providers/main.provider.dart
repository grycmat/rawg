import 'package:injectable/injectable.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/models/genres_response/genres_response.dart';
import 'package:rawg/providers/genre.provider.dart';
import 'package:rawg/services/http.service.dart';

@singleton
class MainProvider {
  MainProvider(GenreProvider provider) {}

  static Future<Map<String, List<Object>>> loadData() async {
    final response = await HttpService.fetchAll();
    final genresResponse = response[0];
    final gamesResponse = response[1];
    List<Genre> genres = List<Genre>.empty();
    List<Game> games = List<Game>.empty();
    genres = GenresResponse.fromMap(genresResponse.data).results ??
        List<Genre>.empty();
    games =
        ApiResponse.fromMap(gamesResponse.data).results ?? List<Game>.empty();

    return {'genres': genres, 'games': games};
  }
}
