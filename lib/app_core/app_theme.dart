import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_colors.dart';
import 'package:movie_app/app_core/app_text_styles.dart';
import 'package:movie_app/app_core/app_text_theme.dart';

/// This class contains the themes used in the app.
/// It is used to manage the themes in a single place
/// and to avoid hardcoding the themes in multiple places
class AppTheme {
  ///Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
      ),
      scaffoldBackgroundColor: AppColors.white,
      primaryTextTheme: AppTextTheme.lightTextTheme,
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        titleTextStyle: AppTextStyles.titleMedium,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shadowColor: AppColors.bottomSheetShadowLight,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        shadowColor: AppColors.drawerShadowLight,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }

  ///Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        error: AppColors.error,
        surface: AppColors.backgroundDark,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      primaryTextTheme: AppTextTheme.darkTextTheme,
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundDark,
        titleTextStyle: AppTextStyles.titleMedium,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.bottomSheetDark,
        shadowColor: AppColors.bottomSheetShadowDark,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.drawerDark,
        shadowColor: AppColors.drawerShadowDark,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
      ),
    );
  }
}
