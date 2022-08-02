import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/result.dart';

class GameDetailsPage extends StatelessWidget {
  const GameDetailsPage({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: 'image__${game.id}',
              child: CachedNetworkImage(
                imageUrl: game.backgroundImage!,
              ),
            ),
            Text(game.name!)
          ],
        ),
      ),
    );
  }
}
