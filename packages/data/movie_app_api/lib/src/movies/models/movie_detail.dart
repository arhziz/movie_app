// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'movie_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetail {
  const MovieDetail({
    this.adult = false,
    this.backdropPath = '',
    this.belongsToCollection = BelongsToCollection.empty,
    this.budget = 0,
    this.genres = const [],
    this.homepage = '',
    this.id = 0,
    this.imdbId = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.releaseDate = '',
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.credits = Credits.empty,
    this.videos = Videos.empty,
  });

  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @JsonKey(name: 'origin_country')
  final List<String> originCountry;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final int revenue;
  final int runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final Credits credits;
  final Videos videos;

  static const empty = MovieDetail();

  static MovieDetail fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  const BelongsToCollection({
    this.id = 0,
    this.name = '',
    this.posterPath = '',
    this.backdropPath = '',
  });
  final int id;
  final String name;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  ///returns an empty object
  static const empty = BelongsToCollection();

  static BelongsToCollection fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  const ProductionCompany({
    this.id = 0,
    this.logoPath = '',
    this.name = '',
    this.originCountry = '',
  });
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  static const empty = ProductionCompany();

  static ProductionCompany fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  const ProductionCountry({
    this.iso31661 = '',
    this.name = '',
  });
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;

  static const empty = ProductionCountry();

  static ProductionCountry fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  const SpokenLanguage({
    this.englishName = '',
    this.iso6391 = '',
    this.name = '',
  });
  @JsonKey(name: 'english_name')
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String name;

  static const empty = SpokenLanguage();

  static SpokenLanguage fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@JsonSerializable()
class Credits {
  const Credits({
    this.cast = const [],
    this.crew = const [],
  });

  final List<Cast> cast;
  final List<Crew> crew;

  static const empty = Credits();

  static Credits fromJson(JsonMap map) => _$CreditsFromJson(map);

  JsonMap toJson() => _$CreditsToJson(this);
}

@JsonSerializable()
class Videos {
  const Videos({
    this.results = const [],
  });
  final List<Video> results;

  static const empty = Videos();

  static Videos fromJson(JsonMap map) => _$VideosFromJson(map);

  JsonMap toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class ExternalIds {
  const ExternalIds({
    this.imdbId = '',
    this.facebookId = '',
    this.instagramId = '',
    this.wikiDataId = '',
    this.twitterId = '',
  });

  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @JsonKey(name: 'facebook_id')
  final String facebookId;
  @JsonKey(name: 'instagram_id')
  final String instagramId;
  @JsonKey(name: 'wikidata_id')
  final String wikiDataId;
  @JsonKey(name: 'twitter_id')
  final String twitterId;

  static const empty = ExternalIds();

  static ExternalIds fromJson(JsonMap map) => _$ExternalIdsFromJson(map);

  JsonMap toJson() => _$ExternalIdsToJson(this);
}
