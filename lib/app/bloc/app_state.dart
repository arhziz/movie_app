part of 'app_bloc.dart';

/// AppState class
/// This class represents the state of the app.
/// It contains the authentication status and the user information.
final class AppState extends Equatable {
  /// Creates an instance of AppState.
  /// The [status] parameter is required and represents the
  /// authentication status.
  /// The [user] parameter is optional and represents the user information.
  const AppState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
    this.appSettings = AppSettings.empty,
  });

  /// The initial state of the app.
  /// This state represents an unknown status.
  const AppState.unknown(AppSettings appSettings)
      : this._(
          appSettings: appSettings,
          status: AuthenticationStatus.unknown,
        );

  /// The state of the app when the user is new.
  /// This state represents a new user.
  const AppState.newuser(AppSettings appSettings)
      : this._(
          appSettings: appSettings,
          status: AuthenticationStatus.newuser,
        );

  /// The state of the app when the user is authenticated.
  /// This state represents an authenticated user.
  const  AppState.authenticated(AppSettings appSettings, User user)
      : this._(
          appSettings: appSettings,
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  /// The state of the app when the user is unauthenticated.
  /// This state represents an unauthenticated user.
  /// This state is used when the user is not logged in.
  const AppState.unauthenticated(
    AppSettings appSettings,
  ) : this._(
          appSettings: appSettings,
          status: AuthenticationStatus.unauthenticated,
        );

  /// The authentication status of the user.
  /// This can be either
  /// [AuthenticationStatus.authenticated] or
  /// [AuthenticationStatus.unauthenticated].
  /// [AuthenticationStatus.unknown] represents an unknown status.
  /// [AuthenticationStatus.newuser] represents a new user.
  final AuthenticationStatus status;

  /// The user information.
  /// This is an instance of [User] class.
  final User user;

  ///
  final AppSettings appSettings;

  @override
  List<Object> get props => [status, user];
}
