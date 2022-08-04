import 'dart:convert';

class Publisher {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  Publisher({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
  });

  factory Publisher.fromMap(Map<String, dynamic> data) => Publisher(
        id: data['id'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        gamesCount: data['games_count'] as int?,
        imageBackground: data['image_background'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'games_count': gamesCount,
        'image_background': imageBackground,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Publisher].
  factory Publisher.fromJson(String data) {
    return Publisher.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Publisher] to a JSON string.
  String toJson() => json.encode(toMap());
}
