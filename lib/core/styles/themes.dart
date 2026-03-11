import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appFonts.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.accentColor,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    fontFamily: AppFonts.poppins,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        padding: EdgeInsets.all(0),
        minimumSize: Size.zero,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      selectedLabelStyle: TextStyles.small.copyWith(
        fontWeight: FontWeight.w500,
        height: 1.8,
      ),
      unselectedLabelStyle: TextStyles.small.copyWith(
        fontWeight: FontWeight.w500,
        height: 1.8,
      ),
    ),
    dividerColor: Colors.transparent,
  );
}
