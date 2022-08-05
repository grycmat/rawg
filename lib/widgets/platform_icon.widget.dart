import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg/models/api_response/platform.dart';

class PlatformIconWidget extends StatelessWidget {
  const PlatformIconWidget({Key? key, required this.platform})
      : super(key: key);

  final Platform platform;
  final double _size = 18.0;

  @override
  Widget build(BuildContext context) {
    switch (platform.slug) {
      case "pc":
        return FaIcon(FontAwesomeIcons.desktop, size: _size);
      case "playstation":
        return FaIcon(FontAwesomeIcons.playstation, size: _size);
      case "xbox":
        return FaIcon(FontAwesomeIcons.xbox, size: _size);
      default:
        return Container();
    }
  }
}
