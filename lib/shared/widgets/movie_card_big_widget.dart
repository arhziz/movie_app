import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/movies/models/movie_model.dart';
import 'package:movie_app/features/movies/view/movie_page.dart';
import 'package:movie_app/shared/extensions/extensions.dart';
import 'package:movie_app_api/movie_app_api.dart';

///
class MovieCardBigWidget extends StatelessWidget {
  ///
  const MovieCardBigWidget({
    required this.movie,
    super.key,
  });

  ///
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigator.push(
          MoviePage.route(
            MovieModel.fromMovie(movie),
          ),
        );
      },
      child: Container(
        height: AppDimens.discoverPosterBigHeight,
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              AppConfigs.preMovieBackdrop(
                movie.backdropPath,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(AppDimens.p28),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: AppDimens.discoverPosterBigHeight * 0.35,
            width: context.sizeWidth,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.p16,
                    vertical: AppDimens.p8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: AppDimens.p14,
                        ),
                      ),
                      Text(
                        AppConfigs.getMovieGenresString(
                          allGenres: context.read<HomeBloc>().state.genresList,
                          movieGenreIds: movie.genreIds,
                        ),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.white.withAlpha(150),
                          fontWeight: FontWeight.w300,
                          fontSize: AppDimens.p10,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Ratings: ',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.white.withAlpha(150),
                            fontWeight: FontWeight.w300,
                            fontSize: AppDimens.p10,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${movie.voteAverage.toStringAsFixed(1)}/10',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: AppDimens.p10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
