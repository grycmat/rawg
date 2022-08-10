import 'package:injectable/injectable.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/models/genres_response/genres_response.dart';
import 'package:rawg/services/http.service.dart';

@singleton
class GenreProvider {
  List<Genre> _genres = [];

  Future<List<Genre>> getGenres() async =>
      _genres.isEmpty ? _loadGenres() : Future.value(_genres);

  Future<List<Genre>> _loadGenres() async {
    final response = await HttpService.fetchGenres();
    final genresResponse = GenresResponse.fromMap(response.data);

    _genres = genresResponse.results ?? [];

    return _genres;
  }
}
