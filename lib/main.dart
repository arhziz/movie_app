import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app/app/app_bloc_observer.dart';
import 'package:movie_app/app/view/app.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app_api_firestore/movie_app_api_firestore.dart';
import 'package:movie_app_repository/movie_app_repository.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MovieAppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  configureHttpClientDependencies('dev');
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  final movieApi = MoviesApiImpl(client: clientLocator<IHttpClient>());
  runApp(MovieApp(moviesApi: movieApi));
}
