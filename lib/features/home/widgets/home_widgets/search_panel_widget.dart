import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/bloc/search/search_bloc.dart';
import 'package:movie_app/features/movies/models/models.dart';
import 'package:movie_app/features/movies/view/movie_page.dart';
import 'package:movie_app/shared/shared.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

/// A widget that represents a search panel in the home view.
/// It is a stateless widget that displays a centered container with
/// a text label.
class SearchPanelWidget extends StatelessWidget {
  /// Creates a [SearchPanelWidget].
  /// This widget does not take any parameters.
  const SearchPanelWidget({super.key});

  /// Creates a page for the [SearchPanelWidget].
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SearchPanelWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(context.read<MovieRepository>()),
      child: Scaffold(
        body: Container(
          decoration: AppTheme.containerGradientBg(),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.navigator.pop();
                        },
                        child: SvgPicture.asset(AppAssets.iconAngleLeft),
                      ),
                      SizedBox(width: AppDimens.p10),
                      const _SearchWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: _SearchResultsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultsWidget extends StatelessWidget {
  const _SearchResultsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == SearchStatus.initial) {
          return const Center(
            child: Text('Start searching for movies...'),
          );
        } else if (state.status == SearchStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == SearchStatus.failure) {
          return const Center(
            child: Text('Failed to load search results.'),
          );
        } else if (state.status == SearchStatus.success ||
            state.status == SearchStatus.loadingMore) {
          return _SearchResultsList(movies: state.movies);
        } else {
          // Optional: fallback for unknown states
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _SearchResultsList extends StatefulWidget {
  const _SearchResultsList({required this.movies});

  final List<Movie> movies;

  @override
  State<_SearchResultsList> createState() => _SearchResultsListState();
}

class _SearchResultsListState extends State<_SearchResultsList> {
  ScrollController scrollController = ScrollController();

  SearchState get state => context.read<SearchBloc>().state;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Load more results if needed
        if (state.currentPage < state.totalPages) {
          context.read<SearchBloc>().add(const SearchLoadMoreEvent());
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const Center(
        child: Text('No results found.'),
      );
    }

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  final movie = widget.movies[index];
                  return _SearchtemWidget(movie: movie);
                },
              ),
            ),
            if (state.status == SearchStatus.loadingMore &&
                state.currentPage < state.totalPages)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SearchtemWidget extends StatelessWidget {
  const _SearchtemWidget({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigator.push(
          MoviePage.route(MovieModel.fromMovie(movie)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.sp,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 5.sp,
        ),
        child: Row(
          children: [
            Container(
              height: 60.sp,
              width: 120.sp,
              margin: EdgeInsets.only(
                right: 10.sp,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.primaryDark.withOpacity(0.5),
                image: DecorationImage(
                  image: NetworkImage(
                    AppConfigs.preMoviePoster(movie.posterPath),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.iconPlayFilled,
                  colorFilter: ColorFilter.mode(
                    AppColors.white.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    movie.releaseDate,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchWidget extends StatefulWidget {
  const _SearchWidget();

  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<_SearchWidget> {
  late final Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: 800);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          _debouncer.run(() {
            context.read<SearchBloc>().add(SearchQueryChanged(value));
          });
        },
        decoration: InputDecoration(
          fillColor: AppColors.white.withOpacity(0.1),
          filled: true,
          hintText: 'Search recent movies...',
          hintStyle: AppTextStyles.bodySmall.copyWith(fontSize: AppDimens.p10),
          prefixIcon: SvgPicture.asset(
            AppAssets.iconSearch,
            fit: BoxFit.scaleDown,
          ), // Leading icon

          suffixIcon: SvgPicture.asset(
            AppAssets.iconSearchFilter,
            fit: BoxFit.scaleDown,
          ), // Trailing icon
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(100),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(250),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(100),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
        ),
      ),
    );
  }
}
