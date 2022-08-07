import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/models/genres_response/genres_response.dart';
import 'package:rawg/services/http.service.dart';

class GenreProvider {
  List<Genre>? _genres;

  Future<List<Genre>> getGenres() async {
    if (_genres == null) {
      return loadGenres();
    }
    return Future.value(_genres);
  }

  loadGenres() async {
    final response = await HttpService.getGenres();
    if (response?.data) {
      final genres = GenresResponse.fromMap(response!.data.data);
      _genres = genres.results;
    }
    return _genres;
  }
}
