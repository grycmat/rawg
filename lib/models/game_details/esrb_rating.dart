import 'dart:convert';

class EsrbRating {
  int? id;
  String? name;
  String? slug;

  EsrbRating({this.id, this.name, this.slug});

  factory EsrbRating.fromMap(Map<String, dynamic> data) => EsrbRating(
        id: data['id'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EsrbRating].
  factory EsrbRating.fromJson(String data) {
    return EsrbRating.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EsrbRating] to a JSON string.
  String toJson() => json.encode(toMap());
}
