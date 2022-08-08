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
          padding: EdgeInsets.all(16),
          child: Container(
            height: 240,
            color: Colors.black12,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(genres[genreIndex].name!)],
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var game in games)
                      if (game.genres != null &&
                          game.genres!.any(
                              (element) => element.id == genres[genreIndex].id))
                        GameWidget(game: game)
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
