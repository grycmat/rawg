import 'package:flutter/material.dart';
import 'package:rawg/models/genres_response/genre.dart';

class GamesForGenrePage extends StatelessWidget {
  const GamesForGenrePage({Key? key, required this.genre}) : super(key: key);
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'genre_id_${genre.id}',
          child: Material(
            child: Text(
              genre.name!,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(4, 30, 73, 1),
              ),
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
