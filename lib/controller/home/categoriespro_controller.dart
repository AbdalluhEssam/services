// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services/controller/cart/cardview_controller.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/datasource/remote/categoreis_data.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart_data.dart';

abstract class CategoriesProController extends GetxController {
  initialData();

  getData();

  addCart(String id);
}

class CategoriesProControllerImp extends CategoriesProController {
  MyServices myServices = Get.find();
  CategoriesProData categoriesProData = CategoriesProData(Get.find());
  CardViewData cardAddData = CardViewData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();
  TextEditingController itemsDesc = TextEditingController();
  TextEditingController itemsDescAr = TextEditingController();
  TextEditingController itemsDescount = TextEditingController();
  List items = [];

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? idPro;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id").toString();
  }

  @override
  void onInit() {
    idPro = Get.arguments['id'];
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesProData.postData(idPro.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['items'] != '{"status":"failure"}') {
          items.addAll(response['items']);
        } else {
          items = [];
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(id, image) async {
    statusRequest = StatusRequest.loading;
    var response =
        await categoriesProData.deleteProduct(id.toString(), image.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future addCart(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardAddData.addData(
      id.toString(),
    );
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Fluttertoast.showToast(
            msg: "success".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
        CardViewControllerImp controllerImp = Get.put(CardViewControllerImp());
        controllerImp.getData();
      } else {
        Fluttertoast.showToast(
            msg: "incart".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
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

  bool itemsActive = true;
  String itemsActiveNum = "1";

  void toggleActive() {
    itemsActive = !itemsActive;
    update();
    if (itemsActive == true) {
      itemsActiveNum = "1";
    } else {
      itemsActiveNum = "0";
    }
    log(itemsActiveNum);
  }

  Future addData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
      var response = await categoriesProData.addProduct(
        name.text,
        nameAr.text,
        itemsDesc.text,
        itemsDescAr.text,
        itemsActiveNum.toString(),
        itemsDescount.text,
        idPro.toString(),
        myFile,
      );
      print(
          "========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          name.clear();
          nameAr.clear();
          itemsDesc.clear();
          itemsDescAr.clear();
          itemsDescount.clear();
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
