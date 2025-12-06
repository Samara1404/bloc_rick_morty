import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.appColorsBg,

    primaryColor: AppColors.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appColorsBg,
      elevation: 0,
      foregroundColor: AppColors.textPrimary,

      centerTitle: true,
    ),

    textTheme: TextTheme(
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,

      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.bodySmall,
    ),
  );
}
