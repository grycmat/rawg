import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/widgets/game.widget.dart';

class GamesByGenreWidget extends StatelessWidget {
  const GamesByGenreWidget(
      {Key? key, required this.games, required this.genres})
      : super(key: key);

  final List<Game> games;
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: ((context, genreIndex) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(genres[genreIndex].name!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(4, 30, 73, 1),
                        )),
                    const Icon(
                      Icons.chevron_right,
                      size: 32,
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var game in games)
                        if (game.genres!.any(
                          (element) => element.id == genres[genreIndex].id,
                        ))
                          GameWidget(game: game, genre: genres[genreIndex])
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
