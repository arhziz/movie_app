import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/app_core/app_dimension.dart';
import 'package:movie_app/features/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:movie_app/features/on_boarding/widgets/genre_tag_widget.dart';
import 'package:movie_app_api/movie_app_api.dart';

///
class GenresGetSuccessWidget extends StatelessWidget {
  ///
  const GenresGetSuccessWidget({
    required this.genresList,
    super.key,
  });

  ///
  final List<Genre> genresList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.p20,
            vertical: AppDimens.p40,
          ),
          child: SizedBox(
            height: 300,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: genresList
                  .map(
                    (genre) => GenreTagWidget(
                      genreName: genre.name,
                      isSelected: state.selectedGenres.contains(genre),
                      onTap: () {
                        context
                            .read<OnBoardingBloc>()
                            .add(OnBoardingGenresSelected(genre));
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
