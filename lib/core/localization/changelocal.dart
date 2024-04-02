import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/services/services.dart';
import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreLang = myServices.sharedPreferences.getString("lang");
    if (sharedPreLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPreLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      changeLang('ar');
      language = const Locale("ar");
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
