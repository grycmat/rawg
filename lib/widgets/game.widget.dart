import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/pages/game_details.page.dart';
import 'package:rawg/widgets/platform_list.widget.dart';
import 'package:skeletons/skeletons.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key, required this.game, required this.genre})
      : super(key: key);

  final Game game;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GameDetailsPage(game: game, genre: genre),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(233, 239, 248, 1),
            ),
            child: Column(children: [
              Hero(
                tag: 'image__${game.id}__${genre.id}',
                child: CachedNetworkImage(
                    placeholder: (context, url) => const SkeletonAvatar(
                          style: SkeletonAvatarStyle(height: 150, width: 220),
                        ),
                    width: 220,
                    height: 150,
                    fit: BoxFit.cover,
                    imageUrl: game.backgroundImage!),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    game.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(4, 30, 73, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_outlined, color: Colors.amber),
                        Text(
                          game.rating.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(68, 71, 76, 1),
                          ),
                        ),
                        Text(
                          '(${game.ratingsCount.toString()})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(68, 71, 76, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
