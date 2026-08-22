import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_color.dart';

ThemeData themeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColor.primaryColor,
      foregroundColor: Color(0xFFFFFCFC),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: LightColor.primaryColor),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: LightColor.backgroundColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: LightColor.primaryColor,
    unselectedItemColor: Color(0xFF363636),
    showUnselectedLabels: true,
  ),
);
