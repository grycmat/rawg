import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/result.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey, offset: Offset(0, 2))
          ]),
          child: Column(children: [
            CachedNetworkImage(
                placeholder: (context, url) => Container(),
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
                imageUrl: game.backgroundImage!),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(game.name!, style: const TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          const Icon(Icons.star_outlined, color: Colors.amber),
                          Text(game.rating.toString(),
                              style: const TextStyle(fontSize: 16)),
                          Text('(${game.ratingsCount.toString()})',
                              style: const TextStyle(fontSize: 12))
                        ],
                      )
                    ])),
          ]),
        ),
      ),
    );
  }
}
