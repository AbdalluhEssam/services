// ignore_for_file: avoid_print, unused_local_variable

import 'package:get/get.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/datasource/remote/homedata.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List banner = [];
  List itemsTopSelling = [];
  int? currentIndex;

  late StatusRequest statusRequest;
  bool time = false;

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    if (time == false) {
      initialData();
      // FirebaseMessaging.instance.getToken().then((value) {
      //   print(value);
      //   String? token = value;
      // });
      String id = myServices.sharedPreferences.getString("id")!;
      // FirebaseMessaging.instance.subscribeToTopic("users");
      // FirebaseMessaging.instance.subscribeToTopic("user$id");
      statusRequest = StatusRequest.success;
      getData();

    }
    time = true;
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        banner.addAll(response['banner']);
        itemsTopSelling.addAll(response['itemstopselling']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
