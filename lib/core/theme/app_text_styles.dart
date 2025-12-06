import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
   static const alive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 3, 41, 117)
  );
   static const dead = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 3, 41, 117)
  );
}
