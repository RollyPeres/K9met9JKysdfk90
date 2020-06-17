import 'package:flutter/material.dart';

import 'shared.dart';

class LightTheme {
  static ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    accentColor: AppColors.primaryColor,
    toggleableActiveColor: AppColors.primaryColor,
    dividerColor: AppColors.whiteF2Color,
    bottomNavigationBarTheme: bottomNavTheme,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 5,
    )
  );

  static BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    elevation: 12,
    unselectedItemColor: AppColors.blackD8Color,
    unselectedIconTheme: IconThemeData(size: Dimens.dp24),
  );
}
