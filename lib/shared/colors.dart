import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Theme Color
  static const Color primaryColor = Color(0xFF1BBE6C);
  static const Color priamryDarkColor = Color(0xFF069965);
  static const Color secondaryColor = Color(0xFF69C464);

  // Custom Color
  static const Color disabledTextColor = Color(0xFF9B9B9B);
  static const Color disabledColor = Color(0xFFE4E4E4);
  static const Color inputBgColor = Color(0xFFFAFAFA);
  static const Color black33Color = Color(0xFF333333);
  static const Color black4bColor = Color(0xFF4B4B4B);
  static const Color black75Color = Color(0xFF757575);
  static const Color blackD8Color = Color(0xFFD8D8D8);
  static const Color whiteF9Color = Color(0xFFF9F9F9);
  static const Color redErrorColor = Color(0xFFC80000);
  static const Color whiteF2Color = Color(0xFFF2F4F5);
  static const Color orangeColor = Color(0xFFF2994A);
  static const Color blueColor = Color(0xFF3887F0);

  static const Color supportProcessedColor = Color(0xFFCEE3FF);
  static const Color supportShippedColor = Color(0xFFFFF0C0);
  static const Color supportCompleteColor = Color(0xFFCCFFE5);
  static const Color supportDeclineColor = Color(0xFFFFE1E1);

  // gradient
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      secondaryColor,
    ],
    tileMode: TileMode.repeated
  );
}
