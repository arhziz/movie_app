import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/bloc/app_bloc.dart';
import 'package:movie_app/app/routes/routes.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

///@template movie_app_item
class MovieApp extends StatelessWidget {
  ///macro movie_app_item
  const MovieApp({required MoviesApi moviesApi, super.key})
      : _moviesApi = moviesApi;

  final MoviesApi _moviesApi;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => MovieRepository(moviesApi: _moviesApi),
          dispose: (repository) => repository.close(),
        ),
        RepositoryProvider(
          create: (_) => AuthenticationRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        )..add(
            const AppUserSubscriptionRequested(),
          ),
        child: const MovieAppView(),
      ),
    );
  }
}

///
class MovieAppView extends StatelessWidget {
  ///
  const MovieAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: FlowBuilder<AuthenticationStatus>(
            state: context.select((AppBloc bloc) => bloc.state.status),
            onGeneratePages: onGenerateAppViewPages,
          ),
        );
      },
    );
  }
}
