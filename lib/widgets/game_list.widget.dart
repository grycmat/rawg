import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/widgets/game.widget.dart';

class GameListWidget extends StatelessWidget {
  const GameListWidget({Key? key, required this.games}) : super(key: key);

  final List<Game>? games;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: games?.length,
    //   itemBuilder: (context, index) => GameWidget(game: games![index]),
    // );
  }
}
