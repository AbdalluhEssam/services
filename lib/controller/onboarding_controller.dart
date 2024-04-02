import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';

import '../core/services/services.dart';

abstract class OnBoardingController extends GetxController {
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  final List<Introduction> list = [
    Introduction(
      titleTextStyle:
          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      subTitleTextStyle:
          const TextStyle(fontSize: 16 , color: Color.fromRGBO(
              206, 206, 206, 1.0)),
      imageWidth: 500,
      imageHeight: 300,
      title: 'Give your home a makeover',
      subTitle: 'the best services that you cloud find for your home , as we have everything that you are in need',
      imageUrl: 'assets/images/on1.png',
    ),
    Introduction(
      titleTextStyle:
          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      subTitleTextStyle:
          const TextStyle(fontSize: 16, color: Color.fromRGBO(
              206, 206, 206, 1.0)),
      imageWidth: 500,
      imageHeight: 300,
      title: 'easy and fast services',
      subTitle: 'include all types of service provider from construction to renovation',
      imageUrl: 'assets/images/on2.png',
    ),
    Introduction(
      titleTextStyle:
          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      subTitleTextStyle:
          const TextStyle(fontSize: 16, color:Color.fromRGBO(
              206, 206, 206, 1.0)),
      imageWidth: 500,
      imageHeight: 300,
      title: 'Feel fresh and relax',
      subTitle: 'search from a list of qualified professionals around you as we bring the best ones for you',
      imageUrl: 'assets/images/on3.png',
    ),
  ];

  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
