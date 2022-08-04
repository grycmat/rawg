import 'dart:convert';

class Platform {
  int? platform;
  String? name;
  String? slug;

  Platform({this.platform, this.name, this.slug});

  factory Platform.fromMap(Map<String, dynamic> data) => Platform(
        platform: data['platform'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'platform': platform,
        'name': name,
        'slug': slug,
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
