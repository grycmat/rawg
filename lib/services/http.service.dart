import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rawg/main.dart';
import 'package:rawg/models/api_response/api_response.dart';

class HttpService {
  static Future<Response>? getGames() => dio.get('${dotenv.env['API']}/games');
  static Future<Response>? getGenres() =>
      dio.get('${dotenv.env['API']}/genres');
  Future<Response>? getGameDetails(int id) =>
      dio.get('${dotenv.env['API']}/games/$id');
}
