import 'dart:convert';

import 'genre.dart';

class GenresResponse {
  int? count;
  dynamic next;
  dynamic previous;
  List<Genre>? results;

  GenresResponse({this.count, this.next, this.previous, this.results});

  factory GenresResponse.fromMap(Map<String, dynamic> data) {
    return GenresResponse(
      count: data['count'] as int?,
      next: data['next'] as dynamic,
      previous: data['previous'] as dynamic,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenresResponse].
  factory GenresResponse.fromJson(String data) {
    return GenresResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenresResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
