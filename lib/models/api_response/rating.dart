import 'dart:convert';

class Rating {
  int? id;
  String? title;
  int? count;
  double? percent;

  Rating({this.id, this.title, this.count, this.percent});

  factory Rating.fromMap(Map<String, dynamic> data) => Rating(
        id: data['id'] as int?,
        title: data['title'] as String?,
        count: data['count'] as int?,
        percent: (data['percent'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'count': count,
        'percent': percent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rating].
  factory Rating.fromJson(String data) {
    return Rating.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rating] to a JSON string.
  String toJson() => json.encode(toMap());
}
