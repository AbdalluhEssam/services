import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/carpro_data.dart';
import '../../../data/datasource/remote/cart_data.dart';

abstract class GlusProController extends GetxController {
  initialData();
  getData();
  addCart(String id);
}

class GlusProControllerImp extends GlusProController {
  MyServices myServices = Get.find();
  GlusProServicesData glusProServicesData = GlusProServicesData(Get.find());
  CardViewData cardAddData = CardViewData(Get.find());

  List glusPro = [];

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? idPro;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
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
    var response = await glusProServicesData.postData(idPro.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        glusPro.addAll(response['glus_product']);
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
        Get.offAllNamed(AppRoute.myHomePageCart);
      } else {
        statusRequest = StatusRequest.failure;
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
