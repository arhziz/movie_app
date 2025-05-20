// ignore_for_file: prefer_constructors_over_static_methods

import 'package:equatable/equatable.dart';
import 'package:movie_app_api/movie_app_api.dart'
    show
        Cast,
        Credits,
        Crew,
        Genre,
        Movie,
        MovieDetail,
        SpokenLanguage,
        Video,
        Videos;

/// This class is used to represent a movie model.
/// It contains all the information about a movie.
/// It is used to display the movie details in the app.
/// It is also used to convert the movie data from the API to the model used in
/// the app.
/// It is a subclass of [Equatable] to allow for easy comparison of instances.
/// It contains the following properties:
class MovieModel extends Equatable {
  /// Creates a [MovieModel] object.
  const MovieModel({
    this.id = 0,
    this.backdropPath = '',
    this.defaultLanguage = '',
    this.genreIds = const [],
    this.genres = const [],
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.originalTitle = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.originCountry = const [],
    this.languages = const [],
    this.credits = CreditsModel.empty,
    this.videos = VideosModel.empty,
  });

  ///
  final int id;

  ///
  final List<int> genreIds;

  ///
  final List<Genre> genres;

  ///
  final String backdropPath;

  ///
  final String defaultLanguage;

  ///
  final String title;

  ///
  final String originalTitle;

  ///
  final String posterPath;

  ///
  final bool video;

  ///
  final double popularity;

  ///
  final String releaseDate;

  ///
  final String overview;

  ///
  final double voteAverage;

  ///
  final double voteCount;

  ///
  final List<String> originCountry;

  ///
  final List<SpokenLanguageModel> languages;

  ///
  final CreditsModel credits;

  ///
  final VideosModel videos;

  ///
  String get movieYear => DateTime.parse(releaseDate).year.toString();

  ///
  static MovieModel fromMovie(Movie movie) => MovieModel(
        id: movie.id,
        genreIds: movie.genreIds,
        backdropPath: movie.backdropPath,
        defaultLanguage: movie.defaultLanguage,
        video: movie.video,
        releaseDate: movie.releaseDate,
        title: movie.title,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );

  ///
  static MovieModel fromMovieDetail(MovieDetail movieDetail) => MovieModel(
        id: movieDetail.id,
        genres: movieDetail.genres,
        backdropPath: movieDetail.backdropPath,
        languages: movieDetail.spokenLanguages
            .map(SpokenLanguageModel.fromRepo)
            .toList(),
        defaultLanguage: movieDetail.originalLanguage,
        originalTitle: movieDetail.originalTitle,
        title: movieDetail.title,
        originCountry: movieDetail.originCountry,
        overview: movieDetail.overview,
        voteAverage: movieDetail.voteAverage,
        popularity: movieDetail.popularity,
        voteCount: double.parse(movieDetail.voteCount.toString()),
        releaseDate: movieDetail.releaseDate,
        posterPath: movieDetail.posterPath,
        credits: CreditsModel.fromRepo(movieDetail.credits),
        videos: VideosModel.fromRepo(movieDetail.videos),
      );

  @override
  List<Object?> get props => [];

  ///
  static const empty = MovieModel();
}

///
class CreditsModel {
  ///
  const CreditsModel({
    this.cast = const [],
    this.crew = const [],
  });

  ///
  final List<CastModel> cast;

  ///
  final List<CrewModel> crew;

  ///
  static CreditsModel fromRepo(Credits credit) => CreditsModel(
        cast: credit.cast.map(CastModel.fromRepo).toList(),
        crew: credit.crew.map(CrewModel.fromRepo).toList(),
      );

  ///
  static const empty = CreditsModel();
}

///
class VideosModel {
  ///
  const VideosModel({
    this.results = const [],
  });

  ///
  final List<VideoModel> results;

  ///
  static VideosModel fromRepo(Videos videos) =>
      VideosModel(results: videos.results.map(VideoModel.fromRepo).toList());

  ///
  static const empty = VideosModel();
}

///
class SpokenLanguageModel {
  ///
  const SpokenLanguageModel({
    this.englishName = '',
    this.iso6391 = '',
    this.name = '',
  });

  ///
  final String englishName;

  ///
  final String iso6391;

  ///
  final String name;

  ///
  static const empty = SpokenLanguageModel();

  ///
  static SpokenLanguageModel fromRepo(SpokenLanguage language) =>
      SpokenLanguageModel(
        englishName: language.englishName,
        iso6391: language.iso6391,
        name: language.name,
      );
}

///
class CastModel {
  ///
  const CastModel({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.castId = 0,
    this.character = '',
    this.creditId = '',
    this.knownForDepartment = '',
    this.name = '',
    this.order = 0,
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
  });

  ///
  final bool adult;

  ///
  final int gender;

  ///
  final int id;

  ///

  final String knownForDepartment;

  ///
  final String name;

  ///

  final String originalName;

  ///
  final double popularity;

  ///

  final String profilePath;

  ///

  final int castId;

  ///
  final String character;

  ///

  final String creditId;

  ///
  final int order;

  ///
  static CastModel fromRepo(Cast cast) => CastModel(
        id: cast.id,
        adult: cast.adult,
        castId: cast.castId,
        character: cast.character,
        popularity: cast.popularity,
        profilePath: cast.profilePath,
        order: cast.order,
        originalName: cast.originalName,
        knownForDepartment: cast.knownForDepartment,
        gender: cast.gender,
        creditId: cast.creditId,
        name: cast.name,
      );

  ///
  static const empty = CastModel();
}

///
class CrewModel {
  ///
  const CrewModel({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.department = '',
    this.creditId = '',
    this.knownForDepartment = '',
    this.name = '',
    this.job = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
  });

  ///
  final bool adult;

  ///
  final int gender;

  ///
  final int id;

  ///
  final String knownForDepartment;

  ///
  final String name;

  ///
  final String originalName;

  ///
  final double popularity;

  ///
  final String profilePath;

  ///
  final String department;

  ///
  final String creditId;

  ///
  final String job;

  ///
  static const empty = CrewModel();

  ///
  static CrewModel fromRepo(Crew cast) => CrewModel(
        id: cast.id,
        adult: cast.adult,
        job: cast.job,
        department: cast.department,
        popularity: cast.popularity,
        profilePath: cast.profilePath,
        originalName: cast.originalName,
        knownForDepartment: cast.knownForDepartment,
        gender: cast.gender,
        creditId: cast.creditId,
        name: cast.name,
      );
}

///
class VideoModel {
  ///
  const VideoModel({
    this.id = '',
    this.iso31661 = '',
    this.iso6391 = '',
    this.key = '',
    this.name = '',
    this.official = false,
    this.publishedAt = '',
    this.site = '',
    this.size = 0,
    this.type = '',
  });

  ///
  final String iso6391;

  ///
  final String iso31661;

  ///
  final String name;

  ///

  final String key;

  ///
  final String site;

  ///
  final int size;

  ///
  final String type;

  ///
  final bool official;

  ///

  final String publishedAt;

  ///
  final String id;

  ///
  static VideoModel fromRepo(Video video) => VideoModel(
        id: video.id,
        iso31661: video.iso31661,
        iso6391: video.iso6391,
        official: video.official,
        publishedAt: video.publishedAt,
        type: video.type,
        site: video.site,
        name: video.name,
        key: video.key,
        size: video.size,
      );

  ///
  static const empty = VideoModel();
}
