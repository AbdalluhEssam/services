import 'dart:developer';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/model/itemsmodel.dart';
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
  List cart = [];
  String? quantity = 1.toString();

  CardViewData cardAddData = CardViewData(Get.find());
  EasyInfiniteDateTimelineController controller =EasyInfiniteDateTimelineController();
  TextEditingController timeHour = TextEditingController();
  DateTime? focusDate;

  @override
  initialData() {

    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    // idUser = myServices.sharedPreferences.getString("id");
  }
  late ItemsModel itemsModel;
  @override
  void onInit() {
    focusDate = DateTime.now();
    itemsModel = ItemsModel();
    initialData();
    itemsModel = Get.arguments['itemsModel'];

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    super.dispose();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars

    super.onClose();
  }


}
