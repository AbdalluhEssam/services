import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 48,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          // controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text("continue".tr),
      ),
    );
  }
}
