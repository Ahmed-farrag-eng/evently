import 'package:evently/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // colorSchemeSeed: AppColors.mainColor,
    highlightColor: Colors.transparent,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    textTheme: _getAppTextTheme(AppColors.grayColor),
    hintColor: AppColors.grayColor,
    splashColor: AppColors.grayColor,
    hoverColor: AppColors.lightTextColor,
    dividerColor: AppColors.mainColor,
    dividerTheme: DividerThemeData(color: AppColors.mainColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
      iconTheme: IconThemeData(color: AppColors.mainColor),
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.mainColor,
      selectedItemColor: AppColors.lightBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(
        color: AppColors.lightBackgroundColor,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    //colorSchemeSeed: AppColors.mainColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      brightness: Brightness.dark,
    ),

    hintColor: AppColors.darkTextColor,
    splashColor: AppColors.mainColor,
    hoverColor: AppColors.darkTextColor,
    dividerColor: AppColors.mainColor,
    dividerTheme: DividerThemeData(color: AppColors.mainColor),
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: _getAppTextTheme(AppColors.darkBackgroundColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      iconTheme: IconThemeData(color: AppColors.mainColor),
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 20,
      backgroundColor: AppColors.darkBackgroundColor,
      selectedItemColor: AppColors.lightBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(
        color: AppColors.lightBackgroundColor,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static TextTheme _getAppTextTheme(Color textColor) {
    return TextTheme(
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
