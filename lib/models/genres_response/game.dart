import 'dart:convert';

class Game {
  int? id;
  String? slug;
  String? name;
  int? added;

  Game({this.id, this.slug, this.name, this.added});

  factory Game.fromMap(Map<String, dynamic> data) => Game(
        id: data['id'] as int?,
        slug: data['slug'] as String?,
        name: data['name'] as String?,
        added: data['added'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'slug': slug,
        'name': name,
        'added': added,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Game].
  factory Game.fromJson(String data) {
    return Game.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Game] to a JSON string.
  String toJson() => json.encode(toMap());
}
