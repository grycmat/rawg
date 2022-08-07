import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/providers/game.provider.dart';
import 'package:rawg/services/http.service.dart';
import 'package:rawg/widgets/game_list.widget.dart';

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
            future: provider.getGames(),
            builder: (context, AsyncSnapshot<List<Game>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GameListWidget(games: snapshot.data);
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
