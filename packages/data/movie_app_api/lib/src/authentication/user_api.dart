import 'package:movie_app_api/movie_app_api.dart';


///@template_start user_api_item
///This is the abstraction of the user api object
///Lets the api users perform crud operations on the user object
///@template_end
abstract class UserApi {
  ///@macro user_api_item
  const UserApi();

  ///gets the user object
  ///returns the user object
  Future<User> getUser();

  ///updates the current user object
  ///takes the a new user object
  ///returns a void
  Future<void> updateUser(User newUser);
}
