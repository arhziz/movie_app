import 'package:movie_app_api/src/authentication/models/user.dart';

///@template_start authentication_api_item
///The Abstreaction of the authentication api
///This will house the sign up, login, logout methods
///@template_end
abstract class AuthenticationApi {
  ///@macro authentication_api_item
  const AuthenticationApi();

  ///logs user in
  ///takes in the email and the user password
  ///returns the user object
  Future<User> login({required String email, required String password});

  ///registers the user
  ///takes in email, password, fullname, phonennumber, country
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String country,
  });

  ///Logs the user out;
  Future<void> signOut();
}
