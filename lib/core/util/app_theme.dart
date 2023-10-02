import 'package:flutter/material.dart';
import 'package:keyword_planner/core/util/colors.dart';

var appTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
        15,
      ))),
  textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: Colors.grey.shade700),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.grey.shade700)),
  primaryColor: AppColor.primary,
  navigationRailTheme: const NavigationRailThemeData(),
  navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: AppColor.primary, backgroundColor: Colors.white),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
  useMaterial3: true,
);
