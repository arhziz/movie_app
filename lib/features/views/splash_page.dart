import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core.dart';

/// {@template splash_page}
/// SplashPage widget
///
/// {@endtemplate}
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  /// Creates a page for the [SplashPage].
  static Page<void> page() => const MaterialPage<void>(child: SplashPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.asset(AppAssets.logo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              'Version 1.0.0',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
