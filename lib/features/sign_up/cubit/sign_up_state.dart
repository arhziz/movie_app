part of 'sign_up_cubit.dart';

/// {@template sign_up_state}
/// The state of the sign up form.
/// This class is used to represent the state of the sign up form.
/// It contains the email, password, confirmed password, and the status of the
///  form.
/// It also contains the error message if there is any.
/// {@endtemplate}
final class SignUpState extends Equatable {
  /// {@macro sign_up_state}
  /// This constructor is used to create an instance of [SignUpState].
  const SignUpState() : this._();

  const SignUpState._({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// The email address of the user.
  /// This is an instance of [Email] class.
  /// It is used to validate the email address.
  final Email email;

  /// The password of the user.
  /// This is an instance of [Password] class.
  /// It is used to validate the password.
  final Password password;

  /// The confirmed password of the user.
  /// This is an instance of [ConfirmedPassword] class.
  /// It is used to validate the confirmed password.
  final ConfirmedPassword confirmedPassword;

  /// The status of the form.
  /// This is an instance of [FormzSubmissionStatus] class.
  /// It is used to represent the status of the form.
  final FormzSubmissionStatus status;

  /// The error message of the form.
  final String? errorMessage;

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated email address.
  SignUpState withEmail(String email) {
    return SignUpState._(
      email: Email.dirty(email),
      password: password,
      confirmedPassword: confirmedPassword,
    );
  }

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated password.
  SignUpState withPassword(String password) {
    return SignUpState._(
      email: email,
      password: Password.dirty(password),
      confirmedPassword: ConfirmedPassword.dirty(
        password: password,
        value: confirmedPassword.value,
      ),
    );
  }

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated confirmed password.
  /// It takes the [confirmedPassword] parameter and emits a new state with the
  SignUpState withConfirmedPassword(String confirmedPassword) {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: ConfirmedPassword.dirty(
        password: password.value,
        value: confirmedPassword,
      ),
    );
  }

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated status.
  /// It takes the [status] parameter and emits a new state with the
  SignUpState withSubmissionInProgress() {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.inProgress,
    );
  }

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated status.
  /// It takes the [status] parameter and emits a new state with the
  SignUpState withSubmissionSuccess() {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.success,
    );
  }

  /// This method is used to create a new instance of [SignUpState]
  /// with the updated status and error message.
  /// It takes the [error] parameter and emits a new state with the
  /// updated status and error message.
  /// If the [error] parameter is null, it will emit a new state with the
  SignUpState withSubmissionFailure([String? error]) {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.failure,
      errorMessage: error,
    );
  }

  /// This method is used to check if the sign up form is valid.
  /// It checks if the email, password, and confirmed password are valid.
  bool get isValid => Formz.validate([email, password, confirmedPassword]);

  @override
  List<Object?> get props => [
        email,
        password,
        confirmedPassword,
        status,
        errorMessage,
      ];
}
