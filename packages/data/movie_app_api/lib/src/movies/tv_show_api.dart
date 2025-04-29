import 'package:movie_app_api/src/movies/models/models.dart';

///@template_start tv_show_item
///The Abstraction of the tv_show api,
///@template_end
abstract class TvShowApi {
  ///@macro movie_api
  const TvShowApi();

  ///gets the movie details
  ///takes in the movie id
  ///returns the movie object
  Future<TvShow> getTvShow(int id);

  ///Gets the list of the movie objects
  ///returns collection of Movie objects
  Future<List<TvShow>> dicoverTvShow();

  ///Searchs movie by name only
  ///returns list of movie object
  Future<List<TvShow>> searchTvShow(String name);
}
