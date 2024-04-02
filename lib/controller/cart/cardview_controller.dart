// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/data/datasource/remote/cart_data.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/model/coupon_model.dart';

abstract class CardViewController extends GetxController {
  initialData();
  getData();
  editData(int id, int q);
  deleteData(int id);
}

class CardViewControllerImp extends CardViewController {
  MyServices myServices = Get.find();
  CardViewData cardViewData = CardViewData(Get.find());


  List cart = [];
  CouponModel? couponModel;
  int? discountCoupon = 0;
  String? couponName;
  String? couponId;
  TextEditingController? myControllerCoupon;
  double priceOrder = 0.0;

  double get price => totalPrice;
  double totalPrice = 0.0;

  num get quantity => totalQuantity;
  num totalQuantity = 0;
  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;
  String? namePro;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    myControllerCoupon = TextEditingController();

    getData();
    initialData();
    super.onInit();
  }

  goToCheckOut() {
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponId": couponId ?? "0",
      "priceorder": priceOrder.toString(),
      "discountcoupon": discountCoupon.toString(),
    });
  }

  @override
  Future getData() async {
    cart.clear();
    statusRequest = StatusRequest.loading;
    var response = await cardViewData.getData();
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        cart.addAll(response['cart']);
        getTotalPrice();
        getTotalQuantity();
        getStringCart();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    print(
        "==============================================================================${cart.length}");

    update();
  }

  @override
  Future deleteData(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await cardViewData.deleteData(id.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
        Fluttertoast.showToast(
            msg: "delete".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future delData() async {
    statusRequest = StatusRequest.loading;
    var response = await cardViewData.cardDelData();
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
  Future editData(int id, int q) async {
    statusRequest = StatusRequest.loading;
    var response = await cardViewData.editData(id.toString(), q.toString());
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

  addCart(int id,int q) {
    totalQuantity++;
    editData(id, q);
    update();
  }
  delCart(int id,int q) {
    if(totalQuantity >0){
      totalQuantity--;
      editData(id, q);
      update();
    }
  }
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    var response = await cardViewData.checkCoupon(myControllerCoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
        totalPrice = totalPrice - totalPrice * (discountCoupon! / 100);
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: "notice".tr,
            messageText: Text("apply".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: "notice".tr,
            messageText: Text("couponfill".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));

        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  double getTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < cart.length; i++) {
      totalPrice += (double.parse(cart[i]['items_price']) * double.parse(cart[i]['quantity']));
      update();
    }
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++$totalPrice");
    return totalPrice ;
  }

  String getStringCart() {
    String str = "";
    for (int i = 0; i < cart.length; i++) {
      str += cart[i]['items_id'].toString();
      str += ",${cart[i]['quantity']}";
      str += "#";
    }
    print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-$str");
    return str;
  }

  num getTotalQuantity() {
    totalQuantity = 0;
    for (int i = 0; i < cart.length; i++) {
      totalQuantity += num.parse(cart[i]['quantity']);
      update();
    }
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++$totalQuantity");
    return totalQuantity;
  }
}
