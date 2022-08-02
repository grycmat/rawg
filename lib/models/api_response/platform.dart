import 'dart:convert';

import 'platform.dart';
import 'requirements_en.dart';

class Platform {
  Platform? platform;
  String? releasedAt;
  RequirementsEn? requirementsEn;
  dynamic requirementsRu;

  Platform({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory Platform.fromMap(Map<String, dynamic> data) => Platform(
        platform: data['platform'] == null
            ? null
            : Platform.fromMap(data['platform'] as Map<String, dynamic>),
        releasedAt: data['released_at'] as String?,
        requirementsEn: data['requirements_en'] == null
            ? null
            : RequirementsEn.fromMap(
                data['requirements_en'] as Map<String, dynamic>),
        requirementsRu: data['requirements_ru'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'platform': platform?.toMap(),
        'released_at': releasedAt,
        'requirements_en': requirementsEn?.toMap(),
        'requirements_ru': requirementsRu,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Platform].
  factory Platform.fromJson(String data) {
    return Platform.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Platform] to a JSON string.
  String toJson() => json.encode(toMap());
}
