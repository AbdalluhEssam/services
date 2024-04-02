// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
    statusRequest = StatusRequest.loading;
    var response = await categoriesProData.postData(idPro.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['items']);
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
}
