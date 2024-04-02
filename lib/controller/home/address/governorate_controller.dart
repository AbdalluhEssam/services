import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/address_data.dart';

abstract class GovernorateController extends GetxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class GovernorateControllerImp extends GovernorateController {
  MyServices myServices = Get.find();
  GovernoratesData governoratesData = GovernoratesData(Get.find());

  List governorate = [];

  int? currentIndex;

  late StatusRequest statusRequest;

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
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    governorate.clear();
    statusRequest = StatusRequest.loading;
    var response = await governoratesData.getData();
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        governorate.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // deleteData(String id) {
  //   var response = mygovernorateData.deleteData(id.toString());
  //   if (kDebugMode) {
  //     print(
  //         "========================================================================$response");
  //   }
  //   governorate.removeWhere(
  //         (element) => element.governorateId == id,
  //   );
  //
  //   update();
  // }

  @override
  goToItems(categories, selectedCat, catId) {
    // Get.toNamed(AppRoute.itemsView,arguments: {
    //   "categories" :  categories ,
    //   "selectedCat" :  selectedCat ,
    //   "catId" :  catId ,
    //
    // });
  }
}
