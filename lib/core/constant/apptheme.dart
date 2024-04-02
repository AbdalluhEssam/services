import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  cardColor: Colors.white,
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColor.backgroundColor,
    foregroundColor: AppColor.primaryColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.backgroundColor,
        statusBarIconBrightness: Brightness.dark),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    headline2: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.gray,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.gray,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  useMaterial3: true,
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  cardColor: Colors.white,
  scaffoldBackgroundColor: AppColor.backgroundColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColor.backgroundColor,
    foregroundColor: AppColor.primaryColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.backgroundColor,
        statusBarIconBrightness: Brightness.dark),
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    headline2: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.gray,
        fontSize: 14,
        fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.gray,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);
