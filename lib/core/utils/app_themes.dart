import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final appTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.publicSans,
    primaryColor: AppColors.primary,
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
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        )
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBackground,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textFieldHint,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.textFieldRadius),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
        ),
      ),
      outlineBorder: BorderSide(
        color: AppColors.textFieldBorder,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.textFieldRadius),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.textFieldRadius),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
        ),
      ),
    ),

    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        color: AppColors.splashIcon
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: AppColors.csAcademyTitle
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.white
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.textFieldTitle,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.bottomBarNotSelectedItem,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );

}