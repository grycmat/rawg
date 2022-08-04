import 'dart:convert';

import 'platform.dart';

class ParentPlatform {
  Platform? platform;

  ParentPlatform({this.platform});

  factory ParentPlatform.fromMap(Map<String, dynamic> data) {
    return ParentPlatform(
      platform: data['platform'] == null
          ? null
          : Platform.fromMap(data['platform'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'platform': platform?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ParentPlatform].
  factory ParentPlatform.fromJson(String data) {
    return ParentPlatform.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ParentPlatform] to a JSON string.
  String toJson() => json.encode(toMap());
}
