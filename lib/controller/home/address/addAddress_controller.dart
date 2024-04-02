import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/address_data.dart';
import '../../../data/model/address_model.dart';
import '../../cart/checkout_controller.dart';
import '../../cart/checkoutglus_controller.dart';
import 'address_controller.dart';

abstract class AddAddressController extends GetxController {
  initialData();
}

class AddAddressControllerImp extends AddAddressController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  late TextEditingController addressStreet;
  late TextEditingController addressName;
  late TextEditingController phone;

  List<AddressModel> address = [];

  int? currentIndex;
  var cat;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String currentRoute = "";


  var addresss = 'Your Address'.obs;
  double? addressLat;

  double? addressLong;

  Future<void> updateLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    addressLat = position.latitude;
    addressLong = position.longitude;
    addresss.value =
        "${place.subAdministrativeArea},${place.administrativeArea},${place.country}";
    statusRequest = StatusRequest.none;
    update();
  }

  //
  // Future<void> requestGps() async {
  //   final loc.PermissionStatus permissionStatus =
  //       await location.requestPermission();
  //   if (permissionStatus != PermissionStatus.granted) {
  //
  //   }
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.defaultDialog(
          title:
              "${translateDataBase("اعطاء صلاحية لل GPS", "Give GPS permission")}",
          middleText: translateDataBase(
              "هل توافق على اعطاء الاذن الرجاء تشغيل ال GPS",
              "Do you agree to run the permission bid please GPS"),
          actions: [
            MaterialButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                Get.back(); //
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              color: AppColor.primaryColor,
              textColor: Colors.white,
              child: Text("yes".tr),
            ),
            MaterialButton(
              onPressed: () {
                Get.back();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              color: AppColor.primaryColor,
              textColor: Colors.white,
              child: Text("no".tr),
            )
          ]);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    update();
    return await Geolocator.getCurrentPosition();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {

    currentRoute = Get.arguments['currentRoute'];
    addressStreet = TextEditingController();
    addressName = TextEditingController();
    phone = TextEditingController();
    updateLocation();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    addressStreet.dispose();
    addressName.dispose();
    phone.dispose();
    super.dispose();
  }

  addAddressData() async {
    if (formState.currentState!.validate()) {
      if (addressLong != null && addressLat != null) {
        statusRequest = StatusRequest.loading;
        var response = await addressData.addAddressData(
            id.toString(),
            addressName.text,
            cat.toString(),
            addressStreet.text,
            addressLat.toString(),
            addressLong.toString());
        if (kDebugMode) {
          print(
              "========================================================================$response");
        }
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            if(currentRoute == "checkoutglus"){
              CheckOutGlusControllerImp checkOutGlusControllerImp = Get.put(CheckOutGlusControllerImp());
              checkOutGlusControllerImp.addListener(() {
                checkOutGlusControllerImp.getAddress();
                checkOutGlusControllerImp.update();
              });


              Get.forceAppUpdate();
              Get.appUpdate();
            }
            if(currentRoute == "checkout"){
              CheckOutControllerImp controller = Get.put(CheckOutControllerImp());
              controller.getAddress();
              controller.update();
              Get.forceAppUpdate();
              Get.appUpdate();
            }


            AddressControllerImp controllerImp = Get.put(AddressControllerImp());
            controllerImp.getData();
            Get.forceAppUpdate();
            Get.appUpdate();
            Get.back();
            Get.rawSnackbar(
                snackPosition: SnackPosition.TOP,
                title: "notice".tr,
                messageText: Text("success".tr),
                backgroundColor: AppColor.primaryColor,
                duration: const Duration(seconds: 1));
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
      } else {
        updateLocation();
      }
    }
    update();
  }
}
