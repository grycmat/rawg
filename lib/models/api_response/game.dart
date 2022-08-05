import 'dart:convert';

import 'added_by_status.dart';
import 'esrb_rating.dart';
import 'genre.dart';
import 'parent_platform.dart';
import 'platform.dart';
import 'rating.dart';
import 'short_screenshot.dart';
import 'store.dart';
import 'tag.dart';

class Game {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? playtime;
  int? suggestionsCount;
  String? updated;
  dynamic userGame;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<Platform>? platforms;
  List<ParentPlatform>? parentPlatforms;
  List<Genre>? genres;
  List<Store>? stores;
  dynamic clip;
  List<Tag>? tags;
  EsrbRating? esrbRating;
  List<ShortScreenshot>? shortScreenshots;

  Game({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  factory Game.fromMap(Map<String, dynamic> data) => Game(
        id: data['id'] as int?,
        slug: data['slug'] as String?,
        name: data['name'] as String?,
        released: data['released'] as String?,
        tba: data['tba'] as bool?,
        backgroundImage: data['background_image'] as String?,
        rating: (data['rating'] as num?)?.toDouble(),
        ratingTop: data['rating_top'] as int?,
        ratings: (data['ratings'] as List<dynamic>?)
            ?.map((e) => Rating.fromMap(e as Map<String, dynamic>))
            .toList(),
        ratingsCount: data['ratings_count'] as int?,
        reviewsTextCount: data['reviews_text_count'] as int?,
        added: data['added'] as int?,
        addedByStatus: data['added_by_status'] == null
            ? null
            : AddedByStatus.fromMap(
                data['added_by_status'] as Map<String, dynamic>),
        metacritic: data['metacritic'] as int?,
        playtime: data['playtime'] as int?,
        suggestionsCount: data['suggestions_count'] as int?,
        updated: data['updated'] as String?,
        userGame: data['user_game'] as dynamic,
        reviewsCount: data['reviews_count'] as int?,
        saturatedColor: data['saturated_color'] as String?,
        dominantColor: data['dominant_color'] as String?,
        platforms: (data['platforms'] as List<dynamic>?)
            ?.map((e) => Platform.fromMap(e as Map<String, dynamic>))
            .toList(),
        parentPlatforms: (data['parent_platforms'] as List<dynamic>?)
            ?.map((e) => ParentPlatform.fromMap(e as Map<String, dynamic>))
            .toList(),
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        stores: (data['stores'] as List<dynamic>?)
            ?.map((e) => Store.fromMap(e as Map<String, dynamic>))
            .toList(),
        clip: data['clip'] as dynamic,
        tags: (data['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromMap(e as Map<String, dynamic>))
            .toList(),
        esrbRating: data['esrb_rating'] == null
            ? null
            : EsrbRating.fromMap(data['esrb_rating'] as Map<String, dynamic>),
        shortScreenshots: (data['short_screenshots'] as List<dynamic>?)
            ?.map((e) => ShortScreenshot.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'slug': slug,
        'name': name,
        'released': released,
        'tba': tba,
        'background_image': backgroundImage,
        'rating': rating,
        'rating_top': ratingTop,
        'ratings': ratings?.map((e) => e.toMap()).toList(),
        'ratings_count': ratingsCount,
        'reviews_text_count': reviewsTextCount,
        'added': added,
        'added_by_status': addedByStatus?.toMap(),
        'metacritic': metacritic,
        'playtime': playtime,
        'suggestions_count': suggestionsCount,
        'updated': updated,
        'user_game': userGame,
        'reviews_count': reviewsCount,
        'saturated_color': saturatedColor,
        'dominant_color': dominantColor,
        'platforms': platforms?.map((e) => e.toMap()).toList(),
        'parent_platforms': parentPlatforms?.map((e) => e.toMap()).toList(),
        'genres': genres?.map((e) => e.toMap()).toList(),
        'stores': stores?.map((e) => e.toMap()).toList(),
        'clip': clip,
        'tags': tags?.map((e) => e.toMap()).toList(),
        'esrb_rating': esrbRating?.toMap(),
        'short_screenshots': shortScreenshots?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Game].
  factory Game.fromJson(String data) {
    return Game.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Game] to a JSON string.
  String toJson() => json.encode(toMap());
}
