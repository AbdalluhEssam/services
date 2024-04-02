import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cart/cardview_controller.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();

  getData();

  addCart(String id);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  MyServices myServices = Get.find();
  CardViewData cardViewData = CardViewData(Get.find());
  late StatusRequest statusRequest;
  late String? username;
  late String? email;
  late String? address;
  late String? nameProduct;
  late String? imageProduct;
  late String descProduct;
  late int? idProduct;
  late int? count;
  late int? priceProduct;
  List cart = [];
  String? quantity = 1.toString();

  CardViewData cardAddData = CardViewData(Get.find());

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    // idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    idProduct = Get.arguments['id'];
    nameProduct = Get.arguments['name'];
    imageProduct = Get.arguments['image'];
    priceProduct = Get.arguments['price'];
    descProduct = Get.arguments['desc'];
    count = Get.arguments['count'];
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {}

  @override
  Future addCart(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardAddData.addData(
      id.toString(),
    );
    log("========================================================================$response");
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

  @override
  void dispose() {
    idProduct = null;
    nameProduct = null;
    imageProduct = null;
    priceProduct = null;
    descProduct = '';
    count = null;
    super.dispose();
  }

  @override
  void onClose() {
    idProduct = null;
    nameProduct = null;
    imageProduct = null;
    priceProduct = null;
    descProduct = '';
    count = null;
    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    idProduct = null;
    nameProduct = null;
    imageProduct = null;
    priceProduct = null;
    descProduct = '';
    count = null;
    return super.onDelete;
  }
}
