import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/controller/cart/cardview_controller.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/datasource/remote/cart/checkout_data.dart';
import '../../data/model/address_model.dart';

abstract class CheckOutController extends GetxController {
  getAddress();
}

class CheckOutControllerImp extends CheckOutController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  bool loading = false;
  List<AddressModel> address = [];
  late TextEditingController phone;
  CheckOutAddData checkOutAddData = CheckOutAddData(Get.find());
  AddressData addressData = Get.put(AddressData(Get.find()));

  String addressId = "0";

  chooseShippingAddresss(String val, String deliverySelect) {
    addressId = val;
    delivery = deliverySelect;
    update();
  }

  num? quantity;
  double? total;
  String? delivery = '0';
  String? couponId;
  String? priceOrder;
  String? discountCoupon;

  @override
  void onInit() {
    total = Get.arguments['total'];
    quantity = Get.arguments['quantity'];
    couponId = Get.arguments['couponId'];
    priceOrder = Get.arguments['priceorder'];
    discountCoupon = Get.arguments['discountcoupon'].toString();
    phone = TextEditingController();
    getAddress();
    if (address.isNotEmpty) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        getAddress();
        update();
      });
    }
    update();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  getAddress() async {
    address.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id").toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List re = response['data'];
        address.addAll(re.map((e) => AddressModel.fromJson(e)));
        addressId = address[0].addressId.toString();
        delivery = address[0].delivery.toString();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  CardViewControllerImp controllerImp = Get.put(CardViewControllerImp());

  Future saveCart() async {
    if (address.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      var response = await checkOutAddData.postData(
        addressId.toString(),
        couponId.toString(),
        total.toString(),
        delivery.toString(),
      );
      if (kDebugMode) {
        print(
            "========================================================================$response");
      }
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
          Get.offAllNamed(AppRoute.myHomePage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.snackbar(
          "${translateDataBase("الرجاء اضافة عنوان", "Please add a address")} ",
          "${translateDataBase("الرجاء اضافة عنوان لاتمام عملية الشراء", "Please add an address to complete the purchase")} ",
          icon: const Icon(Icons.location_on),
          barBlur: 2,
          margin: EdgeInsets.zero,
          backgroundColor: AppColor.primaryColor.withOpacity(0.4),
          isDismissible: true,
          duration: const Duration(seconds: 3),
          colorText: AppColor.black,
          borderRadius: 0);
      getAddress();
    }
    update();
  }
}
