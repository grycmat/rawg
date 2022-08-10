import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rawg/main.dart';
import 'package:rawg/models/api_response/api_response.dart';

class HttpService {
  static Future<Response> fetchGames() => dio.get('${dotenv.env['API']}/games');
  static Future<Response> fetchGamesByGenre(int genreId) =>
      dio.get('${dotenv.env['API']}/games?genre=$genreId');
  static Future<Response> fetchGenres() =>
      dio.get('${dotenv.env['API']}/genres');
  Future<Response> getGameDetails(int id) =>
      dio.get('${dotenv.env['API']}/games/$id');

  static Future<List<Response>> fetchAll() =>
      Future.wait([fetchGenres(), fetchGames()]);
}
