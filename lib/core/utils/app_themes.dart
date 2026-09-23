import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final theme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.publicSans,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    ),
    
  );
}