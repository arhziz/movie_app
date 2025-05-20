import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'sign_up_state.dart';

/// SignUpCubit class
/// This class is responsible for managing the sign-up state.
/// It extends the [Cubit] class from the package.
class SignUpCubit extends Cubit<SignUpState> {
  /// Creates an instance of [SignUpCubit].
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  /// This method is used to change the email in the sign-up form.
  /// It takes the [email] parameter and emits a new state with the
  /// updated email.
  void emailChanged(String email) => emit(state.withEmail(email));

  /// This method is used to change the password in the sign-up form.
  /// It takes the [password] parameter and emits a new state with the
  void passwordChanged(String password) => emit(state.withPassword(password));

  /// This method is used to change the confirmed password in the sign-up form.
  /// It takes the [confirmedPassword] parameter and emits a new state with the
  void confirmedPasswordChanged(String confirmedPassword) {
    emit(state.withConfirmedPassword(confirmedPassword));
  }

  /// This method is used to check if the sign-up form is valid.
  /// It checks if the email, password, and confirmed password are valid.
  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.withSubmissionInProgress());
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.withSubmissionSuccess());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }

  /// This method is called when the user clicks the "Log in with Google"
  /// button.
  Future<void> logInWithGoogle() async {
    emit(state.withSubmissionInProgress());
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.withSubmissionSuccess());
    } on LogInWithGoogleFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }
}
