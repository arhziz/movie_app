import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/sign_up/cubit/cubit.dart';
import 'package:movie_app/features/sign_up/views/views.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

/// This is the sign up page of the app
/// It contains the sign up form and the app bar
/// It uses the SignUpCubit to manage the sign up state
/// and the AuthenticationRepository to authenticate the user
class SignUpPage extends StatelessWidget {
  /// Creates an instance of [SignUpPage].
  const SignUpPage({super.key});

  /// This method is used to create a page for the [SignUpPage].
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
