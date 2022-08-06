import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rawg/interceptors/api.interceptor.dart';
import 'package:rawg/pages/main.page.dart';

var dio = Dio();
void main() async {
  await dotenv.load(fileName: ".env");
  final apiKey = dotenv.env['API_KEY'];
  dio.interceptors.add(ApiInterceptor());
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 500;
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
