import 'dart:convert';

class ShortScreenshot {
  int? id;
  String? image;

  ShortScreenshot({this.id, this.image});

  factory ShortScreenshot.fromMap(Map<String, dynamic> data) {
    return ShortScreenshot(
      id: data['id'] as int?,
      image: data['image'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShortScreenshot].
  factory ShortScreenshot.fromJson(String data) {
    return ShortScreenshot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShortScreenshot] to a JSON string.
  String toJson() => json.encode(toMap());
}
