import 'package:flutter/material.dart';
import 'package:rawg/models/api_response/parent_platform.dart';
import 'package:rawg/widgets/platform_icon.widget.dart';

class PlatformListWidget extends StatelessWidget {
  const PlatformListWidget({Key? key, required this.platforms})
      : super(key: key);

  final List<ParentPlatform> platforms;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: platforms
          .map((e) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: PlatformIconWidget(platform: e.platform!),
              ))
          .toList(),
    );
  }
}
