// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:services/controller/onboarding_controller.dart';
// import '../../../core/constant/color.dart';
// import '../../../data/datasource/static/static.dart';
//
// class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
//   const CustomSliderOnBoarding({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//         controller: controller.pageController,
//         onPageChanged: (val) {
//           controller.onPageChanged(val);
//         },
//         itemCount: onBoardingList.length,
//         itemBuilder: (context, i) => Column(
//               children: [
//                 const SizedBox(
//                   height: 80,
//                 ),
//                 Image.asset(
//                   onBoardingList[i].image!,
//                   width: 200,
//                   // height: 200,
//                   fit: BoxFit.fill,
//                 ),
//                 const SizedBox(
//                   height: 90,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     onBoardingList[i].text!,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.black),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   width: 350,
//                   alignment: Alignment.center,
//                   child: Text(
//                     onBoardingList[i].body!,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         height: 2, color: AppColor.gray, fontSize: 14),
//                   ),
//                 ),
//               ],
//             ));
//   }
// }
