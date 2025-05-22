// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MovieDetail',
      json,
      ($checkedConvert) {
        final val = MovieDetail(
          adult: $checkedConvert('adult', (v) => v as bool? ?? false),
          backdropPath:
              $checkedConvert('backdrop_path', (v) => v as String? ?? ''),
          belongsToCollection: $checkedConvert(
            'belongs_to_collection',
            (v) => v == null
                ? BelongsToCollection.empty
                : BelongsToCollection.fromJson(v as Map<String, dynamic>),
          ),
          budget: $checkedConvert('budget', (v) => (v as num?)?.toInt() ?? 0),
          genres: $checkedConvert(
            'genres',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
          ),
          homepage: $checkedConvert('homepage', (v) => v as String? ?? ''),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          imdbId: $checkedConvert('imdb_id', (v) => v as String? ?? ''),
          originCountry: $checkedConvert(
            'origin_country',
            (v) =>
                (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                const [],
          ),
          originalLanguage:
              $checkedConvert('original_language', (v) => v as String? ?? ''),
          originalTitle:
              $checkedConvert('original_title', (v) => v as String? ?? ''),
          overview: $checkedConvert('overview', (v) => v as String? ?? ''),
          popularity: $checkedConvert(
            'popularity',
            (v) => (v as num?)?.toDouble() ?? 0,
          ),
          posterPath: $checkedConvert('poster_path', (v) => v as String? ?? ''),
          productionCompanies: $checkedConvert(
            'production_companies',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) =>
                          ProductionCompany.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                const [],
          ),
          productionCountries: $checkedConvert(
            'production_countries',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) =>
                          ProductionCountry.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                const [],
          ),
          releaseDate:
              $checkedConvert('release_date', (v) => v as String? ?? ''),
          revenue: $checkedConvert('revenue', (v) => (v as num?)?.toInt() ?? 0),
          runtime: $checkedConvert('runtime', (v) => (v as num?)?.toInt() ?? 0),
          spokenLanguages: $checkedConvert(
            'spoken_languages',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) => SpokenLanguage.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                const [],
          ),
          status: $checkedConvert('status', (v) => v as String? ?? ''),
          tagline: $checkedConvert('tagline', (v) => v as String? ?? ''),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          video: $checkedConvert('video', (v) => v as bool? ?? false),
          voteAverage: $checkedConvert(
            'vote_average',
            (v) => (v as num?)?.toDouble() ?? 0,
          ),
          voteCount:
              $checkedConvert('vote_count', (v) => (v as num?)?.toInt() ?? 0),
          credits: $checkedConvert(
            'credits',
            (v) => v == null
                ? Credits.empty
                : Credits.fromJson(v as Map<String, dynamic>),
          ),
          videos: $checkedConvert(
            'videos',
            (v) => v == null
                ? Videos.empty
                : Videos.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'backdropPath': 'backdrop_path',
        'belongsToCollection': 'belongs_to_collection',
        'imdbId': 'imdb_id',
        'originCountry': 'origin_country',
        'originalLanguage': 'original_language',
        'originalTitle': 'original_title',
        'posterPath': 'poster_path',
        'productionCompanies': 'production_companies',
        'productionCountries': 'production_countries',
        'releaseDate': 'release_date',
        'spokenLanguages': 'spoken_languages',
        'voteAverage': 'vote_average',
        'voteCount': 'vote_count',
      },
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection.toJson(),
      'budget': instance.budget,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries.map((e) => e.toJson()).toList(),
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages':
          instance.spokenLanguages.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'credits': instance.credits.toJson(),
      'videos': instance.videos.toJson(),
    };

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BelongsToCollection',
      json,
      ($checkedConvert) {
        final val = BelongsToCollection(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          posterPath: $checkedConvert('poster_path', (v) => v as String? ?? ''),
          backdropPath:
              $checkedConvert('backdrop_path', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'posterPath': 'poster_path',
        'backdropPath': 'backdrop_path',
      },
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
  BelongsToCollection instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductionCompany',
      json,
      ($checkedConvert) {
        final val = ProductionCompany(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          logoPath: $checkedConvert('logo_path', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          originCountry:
              $checkedConvert('origin_country', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'logoPath': 'logo_path',
        'originCountry': 'origin_country',
      },
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductionCountry',
      json,
      ($checkedConvert) {
        final val = ProductionCountry(
          iso31661: $checkedConvert('iso_3166_1', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'iso31661': 'iso_3166_1'},
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SpokenLanguage',
      json,
      ($checkedConvert) {
        final val = SpokenLanguage(
          englishName:
              $checkedConvert('english_name', (v) => v as String? ?? ''),
          iso6391: $checkedConvert('iso_639_1', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'englishName': 'english_name',
        'iso6391': 'iso_639_1',
      },
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };

Credits _$CreditsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Credits',
      json,
      ($checkedConvert) {
        final val = Credits(
          cast: $checkedConvert(
            'cast',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
          ),
          crew: $checkedConvert(
            'crew',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Videos',
      json,
      ($checkedConvert) {
        final val = Videos(
          results: $checkedConvert(
            'results',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'results': instance.results,
    };

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ExternalIds',
      json,
      ($checkedConvert) {
        final val = ExternalIds(
          imdbId: $checkedConvert('imdb_id', (v) => v as String? ?? ''),
          facebookId: $checkedConvert('facebook_id', (v) => v as String? ?? ''),
          instagramId:
              $checkedConvert('instagram_id', (v) => v as String? ?? ''),
          wikiDataId: $checkedConvert('wikidata_id', (v) => v as String? ?? ''),
          twitterId: $checkedConvert('twitter_id', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'imdbId': 'imdb_id',
        'facebookId': 'facebook_id',
        'instagramId': 'instagram_id',
        'wikiDataId': 'wikidata_id',
        'twitterId': 'twitter_id',
      },
    );

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'wikidata_id': instance.wikiDataId,
      'twitter_id': instance.twitterId,
    };
