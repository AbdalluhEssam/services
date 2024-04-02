import 'dart:developer';

import 'package:get/get.dart';
import 'package:services/data/model/order_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/checkout_data.dart';

abstract class OrderDetViewController extends GetxController {
  initialData();
  getDataCart();

}

class OrderDetViewControllerImp extends OrderDetViewController {
  MyServices myServices = Get.find();
  OrderDetViewData orderDetViewData = OrderDetViewData(Get.find());

  List cart_d = [];

  double get price => totalPrice;
  double totalPrice = 0.0;

  num get quantity => totalQuantity;
  num totalQuantity = 0;
  late StatusRequest statusRequest;
  double? idOrder;
  late OrderModel orderModel;

  @override
  initialData() {

  }

  @override
  void onInit() {
    idOrder = Get.arguments['order_id'];
    orderModel = Get.arguments['orderModel'];
    getDataCart();
    initialData();
    super.onInit();
  }



  @override
  Future getDataCart() async {
    statusRequest = StatusRequest.loading;
    var response = await orderDetViewData.getData(
        idOrder.toString()
    );
    log(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        cart_d.addAll(response['catr_d']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    log(
        "==============================================================================${cart_d.length}");
    update();
  }

}