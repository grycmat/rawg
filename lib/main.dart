import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rawg/models/api_response/api_response.dart';
import 'package:rawg/pages/main.page.dart';

import 'package:rawg/services/http.service.dart';

var dio = Dio();
void main() async {
  await dotenv.load(fileName: ".env");
  final apiKey = dotenv.env['API_KEY'];
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.queryParameters = {
          ...options.queryParameters,
          'key': dotenv.env['API_KEY']
        };

        handler.next(options);
      },
      onError: (e, handler) => print(e.toString()),
    ),
  );
  runApp(const Rawg());
}

class Rawg extends StatelessWidget {
  const Rawg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
