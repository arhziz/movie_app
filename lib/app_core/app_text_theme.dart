import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_colors.dart';
import 'package:movie_app/app_core/app_text_styles.dart';

/// This class contains the text themes used in the app.
/// It is used to manage the text themes in a single place
/// and to avoid hardcoding the text themes in multiple places
class AppTextTheme {
  ///Simple text theme
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: AppColors.primaryLight),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.primaryLight),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: AppColors.primaryLight),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: AppColors.secondaryLight),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryLight),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: AppColors.secondaryLight),
    );
  }

  ///Dark text theme
  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: AppColors.primaryDark),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.primaryDark),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
    );
  }
}
