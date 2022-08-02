import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/services/http.service.dart';
import 'package:rawg/widgets/game_list.widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: HttpService().getGames(),
            builder: (context, AsyncSnapshot<Response> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final response = snapshot.data!.data;
                  final apiResponse = ApiResponse.fromMap(response);

                  return GameListWidget(games: apiResponse.results);
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
