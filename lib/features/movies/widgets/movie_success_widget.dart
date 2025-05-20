import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/movies/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/models/movie_model.dart';
import 'package:movie_app/shared/shared.dart';

///
class MovieSuccessWidget extends StatelessWidget {
  /// Creates a [MovieSuccessWidget] widget.
  const MovieSuccessWidget({
    required this.movie,
    super.key,
  });

  /// The movie to be displayed.
  /// This is a required parameter.
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.moviesBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _AppBar(movie: movie),
          _BodyListWidget(movie: movie),
        ],
      ),
    );
  }
}

//#region APP BAR SECTION

//#region APP BAR
class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      onStretchTrigger: () async {
        // Triggers when stretching
      },
      leading: const _BackButtonWidget(),
      title: const _TitleWidget(),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.sp),
          bottomRight: Radius.circular(50.sp),
        ),
      ),
      stretchTriggerOffset: 300,
      expandedHeight: context.sizeHeight * 0.60,
      flexibleSpace: const _JumbotronBodyWidget(),
    );
  }
}
//#endregion APP BAR

//#region BACK BUTTON
class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClickableContainerWidget(
        bgColor: AppColors.backButtonColor,
        onTap: context.navigator.pop,
        child: SvgPicture.asset(
          AppAssets.iconAngleLeft,
        ),
      ),
    );
  }
}
//#endregion BACK BUTTON
//#region TITLE

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Movies',
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
//#endregion TITLE

//#region JUMBOTRON
class _JumbotronBodyWidget extends StatelessWidget {
  const _JumbotronBodyWidget();

  //final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final movie = context.read<MovieBloc>().state.movie;

    return Container(
      padding: EdgeInsets.all(0.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.sp),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            AppConfigs.preMovieBackdrop(
              movie.posterPath,
            ),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.1),
              Colors.transparent,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(25.sp),
                    height: 100.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      color: AppColors.primaryDark.withOpacity(0.5),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.iconPlayFilled,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MovieTitleWidget(movie: movie),
                    _MovieRatingsWidget(movie: movie),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//#endregion JUMBOTRON

//#endregion APP BAR SECTION

//#region BODY LIST
class _MovieRatingsWidget extends StatelessWidget {
  const _MovieRatingsWidget({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${movie.voteAverage.toStringAsFixed(1)}/10',
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              width: 5.sp,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.sp),
              child: SvgPicture.asset(
                AppAssets.iconStar,
                width: 10.sp,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  Colors.yellow,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              width: 5.sp,
            ),
            Text(
              '(${movie.voteCount.toStringAsFixed(0)} Reviews)',
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 8.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
//#endregion BODY LIST

//#region MOVIE TITLE
class _MovieTitleWidget extends StatelessWidget {
  const _MovieTitleWidget({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
        Text(
          // ignore: lines_longer_than_80_chars
          '${movie.movieYear}   •   ${movie.genres.first.name}   •   ${movie.languages.length} Languages',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: AppColors.white.withAlpha(190),
            fontSize: 8.sp,
          ),
        ),
      ],
    );
  }
}
//#endregion MOVIE TITLE

//#region BODY LIST
class _BodyListWidget extends StatelessWidget {
  const _BodyListWidget({
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            _GenresWidget(movie: movie),
            _MovieOverView(movie: movie),
            _CastCrewClipsWidget(movie: movie),
          ],
        ),
      ),
    );
  }
}

class _CastCrewClipsWidget extends StatelessWidget {
  const _CastCrewClipsWidget({required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.white,
            isScrollable: true,
            dividerColor: AppColors.dividerColor,
            dividerHeight: 3.sp,
            indicatorWeight: 3.sp,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                child: Text(
                  'Cast',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Trailers & Clips',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Crew',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.sizeHeight * 0.8,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                // Cast
                SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.sp,
                    ),
                    itemCount: movie.credits.cast.length,
                    itemBuilder: (context, index) {
                      final cast = movie.credits.cast[index];
                      return _CastItemWidget(cast: cast);
                    },
                  ),
                ),
                // Trailers & Clips
                SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.sp,
                    ),
                    itemCount: movie.videos.results.length,
                    itemBuilder: (context, index) {
                      final video = movie.videos.results[index];
                      return _VideoItemWidget(video: video);
                    },
                  ),
                ),
                // Crew
                SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.sp,
                    ),
                    itemCount: movie.credits.crew.length,
                    itemBuilder: (context, index) {
                      final crew = movie.credits.crew[index];
                      return _CrewItemWidget(crew: crew);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoItemWidget extends StatelessWidget {
  const _VideoItemWidget({
    required this.video,
  });

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 5.sp,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.name,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  video.site,
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
    );
  }
}

class _CastItemWidget extends StatelessWidget {
  const _CastItemWidget({
    required this.cast,
  });

  final CastModel cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 5.sp,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundImage: NetworkImage(
              AppConfigs.preMovieBackdrop(
                cast.profilePath,
              ),
            ),
          ),
          SizedBox(
            width: 10.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cast.name,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                cast.character,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CrewItemWidget extends StatelessWidget {
  const _CrewItemWidget({
    required this.crew,
  });

  final CrewModel crew;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 5.sp,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundImage: NetworkImage(
              AppConfigs.preMovieBackdrop(
                crew.profilePath,
              ),
            ),
          ),
          SizedBox(
            width: 10.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                crew.name,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                crew.department,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//#endregion BODY LIST

//#region MOVIE OVERVIEW

class _MovieOverView extends StatelessWidget {
  const _MovieOverView({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      child: Text(
        movie.overview,
        style: context.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 9.sp,
          color: AppColors.white.withAlpha(190),
        ),
      ),
    );
  }
}
//#endregion MOVIE OVERVIEW

//#region MOVIE GENRES
///
class _GenresWidget extends StatelessWidget {
  const _GenresWidget({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      width: context.sizeWidth,
      child: ListView.builder(
        itemCount: movie.genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50.sp,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  right: 10.sp,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 5.sp,
                ),
                constraints: BoxConstraints(maxHeight: 30.sp),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.white.withAlpha(50),
                  ),
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xff55302F),
                ),
                child: Text(
                  movie.genres[index].name,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//#endregion MOVIE GENRES
