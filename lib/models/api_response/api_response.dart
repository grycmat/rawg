import 'dart:convert';

import 'filters.dart';
import 'game.dart';

class ApiResponse {
  int? count;
  String? next;
  dynamic previous;
  List<Game>? results;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? seoH1;
  bool? noindex;
  bool? nofollow;
  String? description;
  Filters? filters;
  List<String>? nofollowCollections;

  ApiResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> data) => ApiResponse(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as dynamic,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Game.fromMap(e as Map<String, dynamic>))
            .toList(),
        seoTitle: data['seo_title'] as String?,
        seoDescription: data['seo_description'] as String?,
        seoKeywords: data['seo_keywords'] as String?,
        seoH1: data['seo_h1'] as String?,
        noindex: data['noindex'] as bool?,
        nofollow: data['nofollow'] as bool?,
        description: data['description'] as String?,
        filters: data['filters'] == null
            ? null
            : Filters.fromMap(data['filters'] as Map<String, dynamic>),
        nofollowCollections: List.from(data['nofollow_collections']),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
        'seo_title': seoTitle,
        'seo_description': seoDescription,
        'seo_keywords': seoKeywords,
        'seo_h1': seoH1,
        'noindex': noindex,
        'nofollow': nofollow,
        'description': description,
        'filters': filters?.toMap(),
        'nofollow_collections': nofollowCollections,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApiResponse].
  factory ApiResponse.fromJson(String data) {
    return ApiResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApiResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
