import 'dart:convert';

import 'store.dart';

class Store {
  int? id;
  String? url;
  Store? store;

  Store({this.id, this.url, this.store});

  factory Store.fromMap(Map<String, dynamic> data) => Store(
        id: data['id'] as int?,
        url: data['url'] as String?,
        store: data['store'] == null
            ? null
            : Store.fromMap(data['store'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'url': url,
        'store': store?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Store].
  factory Store.fromJson(String data) {
    return Store.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Store] to a JSON string.
  String toJson() => json.encode(toMap());
}
