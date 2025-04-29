part of 'login_cubit.dart';

/// The state of the login form.
/// It contains the email and password fields, the submission status,
/// and an optional error message.
/// The state is immutable and can be created using the [LoginState]
/// constructor.
final class LoginState extends Equatable {
  /// Creates an instance of [LoginState].
  /// The [email] and [password] parameters are required and represent
  /// the email and password fields respectively.
  const LoginState() : this._();

  const LoginState._({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// Creates a copy of the current state with the given email.
  /// The [email] parameter is required and represents the email field.
  LoginState withEmail(String email) {
    return LoginState._(email: Email.dirty(email), password: password);
  }

  /// Creates a copy of the current state with the given password.
  /// The [password] parameter is required and represents the password field.
  LoginState withPassword(String password) {
    return LoginState._(email: email, password: Password.dirty(password));
  }

  /// Creates a copy of the current state with the given status.
  /// The [status] parameter is required and represents the submission status.
  LoginState withSubmissionInProgress() {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.inProgress,
    );
  }

  /// Creates a copy of the current state with the given status.
  /// The [status] parameter is required and represents the submission status.

  LoginState withSubmissionSuccess() {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.success,
    );
  }

  /// Creates a copy of the current state with the given status and error
  /// message.
  /// The [error] parameter is optional and represents the error message.
  /// The [status] parameter is required and represents the submission status.
  LoginState withSubmissionFailure([String? error]) {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.failure,
      errorMessage: error,
    );
  }

  /// The email field of the login form.
  final Email email;

  /// The password field of the login form.
  final Password password;

  /// The submission status of the login form.
  /// This can be either [FormzSubmissionStatus.initial],
  final FormzSubmissionStatus status;

  /// The error message of the login form.
  final String? errorMessage;

  /// Returns true if the form is valid.
  bool get isValid => Formz.validate([email, password]);

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
