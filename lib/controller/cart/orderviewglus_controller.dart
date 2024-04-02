// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/checkout_data.dart';

abstract class OrderViewGlusController extends GetxController {
  initialData();

  getData();
}

class OrderViewGlusControllerImp extends OrderViewGlusController {
  MyServices myServices = Get.find();
  OrderGlusViewData orderGlusViewData = OrderGlusViewData(Get.find());

  List orderGlus = [];

  double get price => totalPrice;
  double totalPrice = 0.0;

  num get quantity => totalQuantity;
  num totalQuantity = 0;
  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;
  String? namePro;
  int? idOrder;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id").toString();
  }

  @override
  void onInit() async {
    getData();
    initialData();
    super.onInit();
  }

  @override
  Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderGlusViewData.getData();
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        orderGlus.addAll(response['orderglus']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    print(
        "==============================================================================${orderGlus.length}");
    update();
  }
}
