import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rawg/main.dart';
import 'package:rawg/models/api_response/api_response.dart';

class HttpService {
  Future<Response>? getGames() => dio.get('${dotenv.env['API']}/games');
}
