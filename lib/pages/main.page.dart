import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/providers/game.provider.dart';
import 'package:rawg/providers/main.provider.dart';
import 'package:rawg/services/http.service.dart';
import 'package:rawg/widgets/game_list.widget.dart';
import 'package:rawg/widgets/games_by_genre.widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: MainProvider.loadData(),
            builder:
                (context, AsyncSnapshot<Map<String, List<Object>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final games = snapshot.data!['games'] as List<Game>;
                  final genres = snapshot.data!['genres'] as List<Genre>;
                  // return GameListWidget(games: snapshot.data);
                  return GamesByGenreWidget(games: games, genres: genres);
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
