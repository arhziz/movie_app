import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/login/cubit/cubit.dart';
import 'package:movie_app/features/login/views/login_form.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

/// LoginPage is a StatelessWidget that provides a
/// login screen for the application.
/// It uses the LoginCubit to manage the login state and the
/// AuthenticationRepository
class LoginPage extends StatelessWidget {
  /// Creates an instance of [LoginPage].
  /// The [key] parameter is used to identify the widget in the widget tree.
  const LoginPage({super.key});

  /// This method is used to create a page for the [LoginPage].
  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  /// This method is used to create a route for the [LoginPage].
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
