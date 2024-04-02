import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/handlingdatacontroller.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/datasource/remote/address_data.dart';
import 'package:services/data/datasource/remote/glus_event_data.dart';
import 'package:services/data/model/address_model.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

abstract class GlusEventController extends GetxController {
  initialData();
  getAddress();
  addOrder();
}

class GlusEventControllerImp extends GlusEventController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlusEventData glusEventData = GlusEventData(Get.find());
  AddressData addressData = AddressData(Get.find());
  late TextEditingController serviceType;
  late TextEditingController data;
  late TextEditingController hour;
  late TextEditingController clientNote;
  List<AddressModel> address = [];

  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late String? addressId = "0";
  late String? delivery = "0";
  String? idUser;

  @override
  initialData() {
    idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    serviceType = TextEditingController();
    data = TextEditingController();
    hour = TextEditingController();
    clientNote = TextEditingController();
    getAddress();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    serviceType.dispose();
    data.dispose();
    hour.dispose();
    clientNote.dispose();
    super.dispose();
  }

  addressSelected(addressSelect, deliverySelect) {
    addressId = addressSelect;
    delivery = deliverySelect;
    update();
  }

  @override
  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(idUser.toString());
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List re = response['data'];
        address.addAll(re.map((e) => AddressModel.fromJson(e)));
      }
    }
  }

  @override
  addOrder() async {
    statusRequest = StatusRequest.loading;
    var response = await glusEventData.addData(addressId.toString(),
        serviceType.text, data.text, hour.text, clientNote.text);
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
  }
}
