import 'dart:convert';

import 'platform.dart';

class MetacriticPlatform {
  int? metascore;
  String? url;
  Platform? platform;

  MetacriticPlatform({this.metascore, this.url, this.platform});

  factory MetacriticPlatform.fromMap(Map<String, dynamic> data) {
    return MetacriticPlatform(
      metascore: data['metascore'] as int?,
      url: data['url'] as String?,
      platform: data['platform'] == null
          ? null
          : Platform.fromMap(data['platform'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'metascore': metascore,
        'url': url,
        'platform': platform?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MetacriticPlatform].
  factory MetacriticPlatform.fromJson(String data) {
    return MetacriticPlatform.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MetacriticPlatform] to a JSON string.
  String toJson() => json.encode(toMap());
}
