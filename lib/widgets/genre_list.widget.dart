import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/genre.dart';

class GenreListWidget extends StatelessWidget {
  const GenreListWidget({Key? key, required this.genres}) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: (context, index) => Text(genres[index].name!),
    );
  }
}
