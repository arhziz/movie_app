import 'package:flutter/material.dart';
import 'package:movie_app/features/home/home.dart';
import 'package:movie_app/features/login/views/views.dart';
import 'package:movie_app/features/on_boarding/views/on_boarding_page.dart';
import 'package:movie_app/features/sign_up/sign_up.dart';
import 'package:movie_app/features/views/splash_page.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

/// The [onGenerateAppViewPages] function is used to generate the pages
/// for the application based on the current [AuthenticationStatus].
/// It takes the current [AuthenticationStatus] and a list of pages as parameters.
/// It returns a list of pages to be displayed in the application.
List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
    case AuthenticationStatus.newuser:
      return [OnBoardingPage.page()];
    case AuthenticationStatus.unknown:
      return [SplashPage.page()];
  }
}
