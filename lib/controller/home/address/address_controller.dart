import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/address_data.dart';
import '../../../data/model/address_model.dart';

abstract class AddressController extends GetxController {
  initialData();
  getData();
}

class AddressControllerImp extends AddressController {

  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> address = [];


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
    address.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(id.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List re = response['data'];
        address.addAll(re.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  deleteAddressData(String idA) async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.deleteData(
      idA.toString(),
    );
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: "notice".tr,
            messageText: Text("delete".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }


}
