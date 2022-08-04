import 'dart:convert';

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({this.minimum, this.recommended});

  factory Requirements.fromMap(Map<String, dynamic> data) => Requirements(
        minimum: data['minimum'] as String?,
        recommended: data['recommended'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'minimum': minimum,
        'recommended': recommended,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Requirements].
  factory Requirements.fromJson(String data) {
    return Requirements.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Requirements] to a JSON string.
  String toJson() => json.encode(toMap());
}
