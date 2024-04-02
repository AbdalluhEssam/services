import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/core/constant/routes.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/imageassets.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  HomeControllerImp controller = Get.put(HomeControllerImp());
  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      await Get.toNamed(AppRoute.myHomePage);
    });
  }

  @override
  void initState() {
    if (controller.time == true) {
      startTimer();
      controller.update();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      AppImageAssets.onBoardingImageglusLogo,
                    )),
              ),

              Expanded(
                flex: 3,
                child: Center(
                  child: Lottie.asset(AppImageAssets.loading,
                      width: Get.width * 0.5, height: Get.width * 0.5),
                ),
              ),

              // SizedBox(height: 10,),
              Expanded(
                flex: 2,
                child: Text(
                  "Service | ©2024",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.6),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
