import 'dart:convert';

import 'year.dart';

class Filters {
  List<Year>? years;

  Filters({this.years});

  factory Filters.fromMap(Map<String, dynamic> data) => Filters(
        years: (data['years'] as List<dynamic>?)
            ?.map((e) => Year.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'years': years?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Filters].
  factory Filters.fromJson(String data) {
    return Filters.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Filters] to a JSON string.
  String toJson() => json.encode(toMap());
}
