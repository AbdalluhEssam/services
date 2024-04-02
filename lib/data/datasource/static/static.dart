import 'package:get/get.dart';
import 'package:services/core/constant/imageassets.dart';
import 'package:services/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      text: "0t".tr, body: "0b".tr, image: AppImageAssets.onBoardingImageOk),
  OnBoardingModel(
      text: "1t".tr,
      body: "1b".tr,
      image: AppImageAssets.onBoardingImageQuality),
  OnBoardingModel(
      text: "2t".tr, body: "2b".tr, image: AppImageAssets.onBoardingImageClean),
  OnBoardingModel(
      text: "3t".tr, body: "3b".tr, image: AppImageAssets.onBoardingImageglu),
];
