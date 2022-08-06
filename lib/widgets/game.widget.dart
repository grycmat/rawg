import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rawg/pages/game_details.page.dart';
import 'package:rawg/widgets/platform_list.widget.dart';
import 'package:skeletons/skeletons.dart';

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
              Stack(
                children: [
                  Hero(
                    tag: 'image__${game.id!}',
                    child: CachedNetworkImage(
                        placeholder: (context, url) => SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                  height: 190, width: double.infinity),
                            ),
                        width: double.infinity,
                        height: 190,
                        fit: BoxFit.cover,
                        imageUrl: game.backgroundImage!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          size: 24,
                          Icons.favorite_outline_rounded,
                          color: Colors.red.shade100,
                        ),
                      )
                    ],
                  ),
                ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star_outlined,
                                  color: Colors.amber),
                              Text(
                                game.rating.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                '(${game.ratingsCount.toString()})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          PlatformListWidget(platforms: game.parentPlatforms!),
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
