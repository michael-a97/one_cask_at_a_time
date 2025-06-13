import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'spacing.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF112328);
  static const Color primaryDarkColor = Color(0xFF0B1519);
  static const Color primaryContainerColor = Color(0xFF112328);
  static const Color secondaryColor = Color(0xFFD49A00);
  static const Color backgroundColor = Color(0xFF0D1D21);
}

final sansSerifFont = GoogleFonts.dmSans().fontFamily;
final serifFont = GoogleFonts.ptSerif().fontFamily;

final theme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorDark: AppColors.primaryDarkColor,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryContainerColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.black,
    error: Colors.red[700]!,
    onError: Colors.white,
    surface: AppColors.primaryColor,
    onSurface: Colors.white,
  ),
  fontFamily: sansSerifFont,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: serifFont,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: serifFont,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: serifFont,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: sansSerifFont,
      fontSize: 20,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontFamily: sansSerifFont,
      fontSize: 16,
      color: Colors.white70,
    ),
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: serifFont,
        fontSize: 14,
      ),
      padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
      elevation: 0,
    ),
  ),

  appBarTheme: const AppBarTheme(color: Colors.transparent),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondaryColor,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: serifFont,
        fontSize: 14,
      ),
      padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
      elevation: 0,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.secondaryColor,
    selectionColor: AppColors.secondaryColor.withAlpha(40),
    selectionHandleColor: AppColors.secondaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    activeIndicatorBorder: const BorderSide(
      color: AppColors.secondaryColor,
      width: 3,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
    ),
    suffixIconColor: AppColors.secondaryColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: sansSerifFont,
      fontSize: 14,
      color: AppColors.secondaryColor,
    ),
    errorMaxLines: 2,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.primaryDarkColor,
    unselectedItemColor: const Color(0xFF899194),
    selectedItemColor: Colors.white,
    selectedLabelStyle: TextStyle(
      fontFamily: sansSerifFont,
      fontSize: 16,
      color: Colors.white70,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: sansSerifFont,
      fontSize: 16,
      color: const Color(0xFF899194),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryDarkColor,
    circularTrackColor: AppColors.secondaryColor,
    refreshBackgroundColor: AppColors.secondaryColor,
  ),
);
