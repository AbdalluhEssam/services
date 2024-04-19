// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/datasource/remote/homedata.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();

  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List banner = [];
  List itemsTopSelling = [];
  int? currentIndex;

  late StatusRequest statusRequest;
  bool time = false;

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    if (time == false) {
      initialData();
      // FirebaseMessaging.instance.getToken().then((value) {
      //   print(value);
      //   String? token = value;
      // });
      String id = myServices.sharedPreferences.getString("id")!;
      // FirebaseMessaging.instance.subscribeToTopic("users");
      // FirebaseMessaging.instance.subscribeToTopic("user$id");
      statusRequest = StatusRequest.success;
      getData();
    }
    time = true;
    super.onInit();
  }

  @override
  getData() async {
    categories.clear();
    items.clear();
    banner.clear();
    itemsTopSelling.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        banner.addAll(response['banner']);
        itemsTopSelling.addAll(response['itemstopselling']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  File? myFile;
  imgGlr() async {
    final XFile? image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint('path: ${image?.path}');

    if (image != null) {
      File? img = File(image.path);
      myFile = img;
      update();
    } else {
      print("No Image Selected");
    }
    update();
  }



  Future addData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
    var response = await homeData.addCategories(name.text, nameAr.text, myFile);
    print( "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        name.clear();
        nameAr.clear();
        myFile = null;
        getData();
        getData();
        Get.back();
        Get.forceAppUpdate();
        Get.appUpdate();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    }
    update();
  }

  Future addBannerData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
    var response = await homeData.addBanner(name.text, myFile);
    print( "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        name.clear();
        nameAr.clear();
        myFile = null;
        getData();
        Get.back();
        Get.forceAppUpdate();
        Get.appUpdate();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    }
    update();
  }
}
