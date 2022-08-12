import 'package:flutter/material.dart';
import 'package:rawg/models/genres_response/genre.dart';

class GamesForGenrePage extends StatelessWidget {
  const GamesForGenrePage({Key? key, required this.genre}) : super(key: key);
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genre.name!),
      ),
      body: Container(),
    );
  }
}
