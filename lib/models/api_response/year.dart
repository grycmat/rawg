import 'dart:convert';

import 'year.dart';

class Year {
  int? from;
  int? to;
  String? filter;
  int? decade;
  List<Year>? years;
  bool? nofollow;
  int? count;

  Year({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  factory Year.fromMap(Map<String, dynamic> data) => Year(
        from: data['from'] as int?,
        to: data['to'] as int?,
        filter: data['filter'] as String?,
        decade: data['decade'] as int?,
        years: (data['years'] as List<dynamic>?)
            ?.map((e) => Year.fromMap(e as Map<String, dynamic>))
            .toList(),
        nofollow: data['nofollow'] as bool?,
        count: data['count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'from': from,
        'to': to,
        'filter': filter,
        'decade': decade,
        'years': years?.map((e) => e.toMap()).toList(),
        'nofollow': nofollow,
        'count': count,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Year].
  factory Year.fromJson(String data) {
    return Year.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Year] to a JSON string.
  String toJson() => json.encode(toMap());
}
