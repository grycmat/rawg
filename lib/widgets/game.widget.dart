import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/result.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rawg/pages/game_details.page.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GameDetailsPage(game: game),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.grey, offset: Offset(0, 2))
            ]),
            child: Column(children: [
              Hero(
                tag: 'image__${game.id!}',
                child: CachedNetworkImage(
                    placeholder: (context, url) => Container(),
                    width: double.infinity,
                    height: 190,
                    fit: BoxFit.cover,
                    imageUrl: game.backgroundImage!),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Hero(
                            transitionOnUserGestures: true,
                            tag: 'title__${game.id!}',
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              child: Text(
                                game.name!,
                              ),
                            )),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_outlined, color: Colors.amber),
                          Text(game.rating.toString(),
                              style: const TextStyle(fontSize: 16)),
                          Text('(${game.ratingsCount.toString()})',
                              style: const TextStyle(fontSize: 12))
                        ],
                      )
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
