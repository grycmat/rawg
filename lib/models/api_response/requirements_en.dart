import 'dart:convert';

class RequirementsEn {
  String? minimum;
  String? recommended;

  RequirementsEn({this.minimum, this.recommended});

  factory RequirementsEn.fromMap(Map<String, dynamic> data) {
    return RequirementsEn(
      minimum: data['minimum'] as String?,
      recommended: data['recommended'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'minimum': minimum,
        'recommended': recommended,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RequirementsEn].
  factory RequirementsEn.fromJson(String data) {
    return RequirementsEn.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RequirementsEn] to a JSON string.
  String toJson() => json.encode(toMap());
}
