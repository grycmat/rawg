import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:rawg/interceptors/api.interceptor.dart';
import 'package:rawg/main.config.dart';
import 'package:rawg/pages/main.page.dart';
import 'package:rawg/providers/game.provider.dart';
import 'package:rawg/providers/genre.provider.dart';

final dio = Dio();
final getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await dotenv.load(fileName: ".env");
  final apiKey = dotenv.env['API_KEY'];
  dio.interceptors.add(ApiInterceptor());
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 500;
  runApp(const Rawg());
}

class Rawg extends StatelessWidget {
  const Rawg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(233, 239, 248, 1),
        ),
      ),
      home: const MainPage(),
    );
  }
}
