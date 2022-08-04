import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rawg/models/api_response/result.dart';
import 'package:rawg/models/api_response/rating.dart';

class GameDetailsPage extends StatelessWidget {
  const GameDetailsPage({Key? key, required this.game}) : super(key: key);
  final Game game;

  _sortRatings(List<Rating> ratings) =>
      ratings.sort((a, b) => b.percent!.compareTo(a.percent!));

  @override
  Widget build(BuildContext context) {
    _sortRatings(game.ratings!);
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
            Hero(
              tag: 'title__${game.id!}',
              transitionOnUserGestures: true,
              child: Material(
                type: MaterialType.transparency,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  child: Text(
                    game.name!,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ListView.builder(
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
                          style: TextStyle(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
