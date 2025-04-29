import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'login_state.dart';

/// LoginCubit class
/// This class is responsible for managing the login state.
class LoginCubit extends Cubit<LoginState> {
  /// Creates an instance of [LoginCubit].
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  /// This method is called when the user changes the email.
  void emailChanged(String email) => emit(state.withEmail(email));

  /// This method is called when the user changes the password.
  void passwordChanged(String password) => emit(state.withPassword(password));

  /// This method is called when the user changes the password confirmation.
  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.withSubmissionInProgress());
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.withSubmissionSuccess());
    } on LogInWithEmailAndPasswordFailure catch (e) {
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
