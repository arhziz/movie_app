import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_api/movie_app_api.dart' show AppSettings, User;
import 'package:movie_app_repository/movie_app_repository.dart'
    show AuthenticationRepository, AuthenticationStatus;

part 'app_event.dart';
part 'app_state.dart';

/// AppBloc class
/// This class is responsible for managing the app state.
/// It extends the [Bloc] class from the package.
class AppBloc extends Bloc<AppEvent, AppState> {
  /// Creates an instance of [AppBloc].
  /// The [authenticationRepository] parameter is required and
  /// represents the authentication repository.
  /// It is used to check if the user is authenticated or not.
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AppState.unknown(AppSettings.empty)) {
    on<AppUserSubscriptionRequested>(_onUserSubscriptionRequested);
    on<AppLoginSubscriptionRequested>(_onAppLoginSubscriptionRequested);
    on<AppLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onUserSubscriptionRequested(
    AppUserSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.status,
      onData: (status) async {
        final appSettings = await _authenticationRepository.currentAppSettings;
        switch (status) {
          case AuthenticationStatus.unauthenticated:
            return emit(AppState.unauthenticated(appSettings));
          case AuthenticationStatus.authenticated:
          
            final user = await _authenticationRepository.currentUser;
            return emit(
              user != User.empty
                  ? AppState.authenticated(appSettings, user)
                  : AppState.unauthenticated(appSettings),
            );
          case AuthenticationStatus.newuser:
            return emit(AppState.newuser(appSettings));
          case AuthenticationStatus.unknown:
            return emit(AppState.unknown(appSettings));
        }
      },
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AppLogoutPressed event,
    Emitter<AppState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  FutureOr<void> _onAppLoginSubscriptionRequested(
    AppLoginSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.user,
      onData: (user) async {
        final appSettings = await _authenticationRepository.currentAppSettings;
        return emit(
          user != User.empty
              ? AppState.authenticated(appSettings, user)
              : AppState.unauthenticated(appSettings),
        );
      },
      onError: addError,
    );
  }
}
