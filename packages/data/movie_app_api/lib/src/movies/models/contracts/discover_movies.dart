// ignore_for_file: public_member_api_docs

enum SortBy {
  originalTitle,
  popularity,
  revenue,
  primaryReleaseDate,
  title,
  voteAverage,
  voteCount
}

class DiscoverMoviesRequest {
  const DiscoverMoviesRequest({
    this.includeAdult = false,
    this.includeVideo = false,
    this.language = 'en-US',
    this.page = 1,
    this.ascending = false,
    this.sortBy = SortBy.popularity,
  });
  final bool includeAdult;
  final bool includeVideo;
  final String language;
  final int page;
  final bool ascending;
  final SortBy sortBy;
}
