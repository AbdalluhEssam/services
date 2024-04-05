// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:services/data/datasource/remote/cart_data.dart';
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
  Booking booking = Booking(Get.find());

  List bookings = [];

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
    var response = await booking.getData();
    print("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        bookings.addAll(response['booking']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }
}
