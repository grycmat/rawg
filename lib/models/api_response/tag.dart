import 'dart:convert';

class Tag {
  int? id;
  String? name;
  String? slug;
  String? language;
  int? gamesCount;
  String? imageBackground;

  Tag({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  factory Tag.fromMap(Map<String, dynamic> data) => Tag(
        id: data['id'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        language: data['language'] as String?,
        gamesCount: data['games_count'] as int?,
        imageBackground: data['image_background'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'language': language,
        'games_count': gamesCount,
        'image_background': imageBackground,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tag].
  factory Tag.fromJson(String data) {
    return Tag.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tag] to a JSON string.
  String toJson() => json.encode(toMap());
}
