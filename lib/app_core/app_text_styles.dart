import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This class contains the text styles used in the app.
/// It is used to manage the text styles in a single place
class AppTextStyles {
  ///Merri Weather Font Family
  static const String interFontFamily = 'Inter';

  ///Headings
  static TextStyle titleLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
    letterSpacing: 0.4,
  );

  ///Medium title
  static TextStyle titleMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    fontFamily: interFontFamily,
    letterSpacing: 0.32,
  );

  ///Small title
  static TextStyle titleSmall = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: interFontFamily,
    letterSpacing: 0.28,
  );

  ///Body
  ///Large body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: interFontFamily,
    letterSpacing: 0.02,
  );

  ///Medium body
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: interFontFamily,
    letterSpacing: 0.24,
  );

  ///Small body
  static TextStyle bodySmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: interFontFamily,
    letterSpacing: 0.24,
  );
}
