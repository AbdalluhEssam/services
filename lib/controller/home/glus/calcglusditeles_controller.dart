import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:services/core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/carpro_data.dart';
import '../../../data/model/glusproduct_model.dart';

abstract class CalcGlusDetailsController extends GetxController {
  initialData();

  getData();
}

class CalcGlusDetailsControllerImp extends CalcGlusDetailsController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController countRoom;
  late TextEditingController countK;
  late TextEditingController countB;
  late TextEditingController countR;
  late TextEditingController countBalcony;
  late TextEditingController note;

  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late String? username;
  late String? email;
  late String? address;
  String? idUser;
  late String? nameProduct;
  late String? imageProduct;
  late String descProduct;
  String? idProduct;
  late double? priceProduct;
  double? total;
  GlusProductModel glusProductModel = GlusProductModel();
  GlusProServicesData glusProServicesData = GlusProServicesData(Get.find());

  List<AdditionsGlusModel> additions = [];
  List<String> isCheckedList = [];

  void updateCheckboxState(String value) {
    if (isCheckedList.contains(value)) {
      isCheckedList.remove(value);
    } else {
      isCheckedList.add(value);
    }

    note.text = isCheckedList.map((element) => element.toString()).join('\n');


    log(note.text);
    update();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
  }

  // "priceb": glusProductModel.kitchenPrice,
  // "price_balcony": glusProductModel.priceBalcony,
  // "total": glusProductModel.totalPrice,

  // "id": int.parse(glusProductModel.idGluspro!),
  // "name": myServices.sharedPreferences.getString("lang") == "en"
  // ? glusProductModel.productName
  //     : glusProductModel.productNameAr,
  // "image": glusProductModel.productImage,
  // "total": int.parse(glusProductModel.totalPrice!),
  // "desc": myServices.sharedPreferences.getString("lang") == "en"
  // ? glusProductModel.productDesc
  //     : glusProductModel.productDescAr,

  @override
  void onInit() {
    glusProductModel = Get.arguments['glusProductModel'];
    idProduct = glusProductModel.idGluspro;
    nameProduct = translateDataBase(
        glusProductModel.productNameAr, glusProductModel.productName);
    imageProduct = glusProductModel.productImage;
    priceProduct = double.parse(glusProductModel.totalPrice!);
    descProduct = translateDataBase(
        glusProductModel.productDescAr, glusProductModel.productDesc);
    total = double.parse(glusProductModel.totalPrice!);
    countRoom = TextEditingController();
    countK = TextEditingController();
    countB = TextEditingController();
    countBalcony = TextEditingController();
    countR = TextEditingController();
    note = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    countRoom.dispose();
    countK.dispose();
    countB.dispose();
    countBalcony.dispose();
    countR.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await glusProServicesData
        .glusAdditionsData(glusProductModel.typesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List addition = response['additions_glus'];
        additions.addAll(addition.map((e) => AdditionsGlusModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
