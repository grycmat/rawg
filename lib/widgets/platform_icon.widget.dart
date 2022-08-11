import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg/models/api_response/platform.dart';

class PlatformIconWidget extends StatelessWidget {
  const PlatformIconWidget({Key? key, required this.platform})
      : super(key: key);

  final Platform platform;
  final double _size = 32.0;

  _getIcon(IconData icon) => ElevatedButton(
      onPressed: () {},
      child: Container(
        height: 60,
        width: 60,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: FaIcon(icon,
                  size: _size, color: const Color.fromRGBO(68, 71, 76, 1)),
            )),
      ));

  @override
  Widget build(BuildContext context) {
    switch (platform.slug) {
      case "pc":
        return _getIcon(FontAwesomeIcons.desktop);
      case "playstation":
        return _getIcon(FontAwesomeIcons.playstation);
      case "xbox":
        return _getIcon(FontAwesomeIcons.xbox);
      default:
        return Container();
    }
  }
}
