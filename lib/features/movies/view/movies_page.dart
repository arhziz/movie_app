import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/cubit/cubit.dart';
import 'package:movie_app/features/movies/widgets/widgets.dart';

///@template movies_page_item
///This is the movies view
///@endemplate
class MoviesPage extends StatelessWidget {
  ///@macro movies_page_item
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return switch (state.status) {
              MoviesStatus.initial => MoviesEmpty(
                  loadMovies: () {
                    return context.read<MoviesCubit>().fetchDiscoveredMovies();
                  },
                ),
              MoviesStatus.loading => const MoviesLoading(),
              MoviesStatus.failure => MoviesError(
                  loadMovies: () {
                    return context.read<MoviesCubit>().fetchDiscoveredMovies();
                  },
                ),
              MoviesStatus.success => MoviesSuccess(
                  discoverMovies: state.discoveredMovies,
                ),
            };
          },
        ),
      ),
    );
  }
}
