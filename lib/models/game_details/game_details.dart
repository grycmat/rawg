import 'dart:convert';

import 'added_by_status.dart';
import 'developer.dart';
import 'esrb_rating.dart';
import 'genre.dart';
import 'metacritic_platform.dart';
import 'parent_platform.dart';
import 'platform.dart';
import 'publisher.dart';
import 'rating.dart';
import 'reactions.dart';
import 'store.dart';
import 'tag.dart';

class GameDetails {
  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  int? metacritic;
  List<MetacriticPlatform>? metacriticPlatforms;
  String? released;
  bool? tba;
  String? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  Reactions? reactions;
  int? added;
  AddedByStatus? addedByStatus;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? creatorsCount;
  int? achievementsCount;
  int? parentAchievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  int? redditCount;
  int? twitchCount;
  int? youtubeCount;
  int? reviewsTextCount;
  int? ratingsCount;
  int? suggestionsCount;
  List<dynamic>? alternativeNames;
  String? metacriticUrl;
  int? parentsCount;
  int? additionsCount;
  int? gameSeriesCount;
  dynamic userGame;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<ParentPlatform>? parentPlatforms;
  List<Platform>? platforms;
  List<Store>? stores;
  List<Developer>? developers;
  List<Genre>? genres;
  List<Tag>? tags;
  List<Publisher>? publishers;
  EsrbRating? esrbRating;
  dynamic clip;
  String? descriptionRaw;

  GameDetails({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  factory GameDetails.fromMap(Map<String, dynamic> data) => GameDetails(
        id: data['id'] as int?,
        slug: data['slug'] as String?,
        name: data['name'] as String?,
        nameOriginal: data['name_original'] as String?,
        description: data['description'] as String?,
        metacritic: data['metacritic'] as int?,
        metacriticPlatforms: (data['metacritic_platforms'] as List<dynamic>?)
            ?.map((e) => MetacriticPlatform.fromMap(e as Map<String, dynamic>))
            .toList(),
        released: data['released'] as String?,
        tba: data['tba'] as bool?,
        updated: data['updated'] as String?,
        backgroundImage: data['background_image'] as String?,
        backgroundImageAdditional:
            data['background_image_additional'] as String?,
        website: data['website'] as String?,
        rating: (data['rating'] as num?)?.toDouble(),
        ratingTop: data['rating_top'] as int?,
        ratings: (data['ratings'] as List<dynamic>?)
            ?.map((e) => Rating.fromMap(e as Map<String, dynamic>))
            .toList(),
        reactions: data['reactions'] == null
            ? null
            : Reactions.fromMap(data['reactions'] as Map<String, dynamic>),
        added: data['added'] as int?,
        addedByStatus: data['added_by_status'] == null
            ? null
            : AddedByStatus.fromMap(
                data['added_by_status'] as Map<String, dynamic>),
        playtime: data['playtime'] as int?,
        screenshotsCount: data['screenshots_count'] as int?,
        moviesCount: data['movies_count'] as int?,
        creatorsCount: data['creators_count'] as int?,
        achievementsCount: data['achievements_count'] as int?,
        parentAchievementsCount: data['parent_achievements_count'] as int?,
        redditUrl: data['reddit_url'] as String?,
        redditName: data['reddit_name'] as String?,
        redditDescription: data['reddit_description'] as String?,
        redditLogo: data['reddit_logo'] as String?,
        redditCount: data['reddit_count'] as int?,
        twitchCount: data['twitch_count'] as int?,
        youtubeCount: data['youtube_count'] as int?,
        reviewsTextCount: data['reviews_text_count'] as int?,
        ratingsCount: data['ratings_count'] as int?,
        suggestionsCount: data['suggestions_count'] as int?,
        alternativeNames: data['alternative_names'] as List<dynamic>?,
        metacriticUrl: data['metacritic_url'] as String?,
        parentsCount: data['parents_count'] as int?,
        additionsCount: data['additions_count'] as int?,
        gameSeriesCount: data['game_series_count'] as int?,
        userGame: data['user_game'] as dynamic,
        reviewsCount: data['reviews_count'] as int?,
        saturatedColor: data['saturated_color'] as String?,
        dominantColor: data['dominant_color'] as String?,
        parentPlatforms: (data['parent_platforms'] as List<dynamic>?)
            ?.map((e) => ParentPlatform.fromMap(e as Map<String, dynamic>))
            .toList(),
        platforms: (data['platforms'] as List<dynamic>?)
            ?.map((e) => Platform.fromMap(e as Map<String, dynamic>))
            .toList(),
        stores: (data['stores'] as List<dynamic>?)
            ?.map((e) => Store.fromMap(e as Map<String, dynamic>))
            .toList(),
        developers: (data['developers'] as List<dynamic>?)
            ?.map((e) => Developer.fromMap(e as Map<String, dynamic>))
            .toList(),
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        tags: (data['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromMap(e as Map<String, dynamic>))
            .toList(),
        publishers: (data['publishers'] as List<dynamic>?)
            ?.map((e) => Publisher.fromMap(e as Map<String, dynamic>))
            .toList(),
        esrbRating: data['esrb_rating'] == null
            ? null
            : EsrbRating.fromMap(data['esrb_rating'] as Map<String, dynamic>),
        clip: data['clip'] as dynamic,
        descriptionRaw: data['description_raw'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'slug': slug,
        'name': name,
        'name_original': nameOriginal,
        'description': description,
        'metacritic': metacritic,
        'metacritic_platforms':
            metacriticPlatforms?.map((e) => e.toMap()).toList(),
        'released': released,
        'tba': tba,
        'updated': updated,
        'background_image': backgroundImage,
        'background_image_additional': backgroundImageAdditional,
        'website': website,
        'rating': rating,
        'rating_top': ratingTop,
        'ratings': ratings?.map((e) => e.toMap()).toList(),
        'reactions': reactions?.toMap(),
        'added': added,
        'added_by_status': addedByStatus?.toMap(),
        'playtime': playtime,
        'screenshots_count': screenshotsCount,
        'movies_count': moviesCount,
        'creators_count': creatorsCount,
        'achievements_count': achievementsCount,
        'parent_achievements_count': parentAchievementsCount,
        'reddit_url': redditUrl,
        'reddit_name': redditName,
        'reddit_description': redditDescription,
        'reddit_logo': redditLogo,
        'reddit_count': redditCount,
        'twitch_count': twitchCount,
        'youtube_count': youtubeCount,
        'reviews_text_count': reviewsTextCount,
        'ratings_count': ratingsCount,
        'suggestions_count': suggestionsCount,
        'alternative_names': alternativeNames,
        'metacritic_url': metacriticUrl,
        'parents_count': parentsCount,
        'additions_count': additionsCount,
        'game_series_count': gameSeriesCount,
        'user_game': userGame,
        'reviews_count': reviewsCount,
        'saturated_color': saturatedColor,
        'dominant_color': dominantColor,
        'parent_platforms': parentPlatforms?.map((e) => e.toMap()).toList(),
        'platforms': platforms?.map((e) => e.toMap()).toList(),
        'stores': stores?.map((e) => e.toMap()).toList(),
        'developers': developers?.map((e) => e.toMap()).toList(),
        'genres': genres?.map((e) => e.toMap()).toList(),
        'tags': tags?.map((e) => e.toMap()).toList(),
        'publishers': publishers?.map((e) => e.toMap()).toList(),
        'esrb_rating': esrbRating?.toMap(),
        'clip': clip,
        'description_raw': descriptionRaw,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GameDetails].
  factory GameDetails.fromJson(String data) {
    return GameDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GameDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
