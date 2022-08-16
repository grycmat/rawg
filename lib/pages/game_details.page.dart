import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rawg/models/api_response/game.dart';
import 'package:rawg/models/api_response/rating.dart';
import 'package:rawg/models/genres_response/genre.dart';
import 'package:rawg/widgets/platform_list.widget.dart';

class GameDetailsPage extends StatelessWidget {
  const GameDetailsPage({Key? key, required this.game, required this.genre})
      : super(key: key);
  final Game game;
  final Genre genre;

  void _sortRatings(List<Rating> ratings) =>
      ratings.sort((a, b) => b.percent!.compareTo(a.percent!));

  @override
  Widget build(BuildContext context) {
    _sortRatings(game.ratings!);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              collapsedHeight: 58,
              expandedHeight: 190,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(233, 239, 248, 0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      type: MaterialType.transparency,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(4, 30, 73, 1),
                        ),
                        child: Text(
                          game.name!,
                        ),
                      ),
                    ),
                  ),
                ),
                background: Hero(
                  tag: 'image__${game.id}__${genre.id}',
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: game.backgroundImage!,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              PlatformListWidget(platforms: game.parentPlatforms!),
              ListView.builder(
                shrinkWrap: true,
                itemCount: game.ratings!.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '${game.ratings![index].title!} - ${game.ratings![index].percent}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        GFProgressBar(
                          percentage: game.ratings![index].percent! / 100,
                          lineHeight: 16,
                          progressBarColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
