import 'dart:convert';

class AddedByStatus {
  int? yet;
  int? owned;
  int? beaten;
  int? toplay;
  int? dropped;
  int? playing;

  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  factory AddedByStatus.fromMap(Map<String, dynamic> data) => AddedByStatus(
        yet: data['yet'] as int?,
        owned: data['owned'] as int?,
        beaten: data['beaten'] as int?,
        toplay: data['toplay'] as int?,
        dropped: data['dropped'] as int?,
        playing: data['playing'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'yet': yet,
        'owned': owned,
        'beaten': beaten,
        'toplay': toplay,
        'dropped': dropped,
        'playing': playing,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddedByStatus].
  factory AddedByStatus.fromJson(String data) {
    return AddedByStatus.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddedByStatus] to a JSON string.
  String toJson() => json.encode(toMap());
}
