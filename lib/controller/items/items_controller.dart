import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';import '../../../core/class/statusrequest.dart';
import '../../data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController{
  initialData();
  getData(String cateId);
  changeCat(int val,String catVal);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List categories = [];
  List items = [];

  int? selectedCat;
  String? catId;
  String? idUser;
  String? username;

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getData(catId!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData(cateId) async {
    // items.clear();
    // statusRequest = StatusRequest.loading;
    // var response = await itemsData.postData(cateId.toString());
    // if (kDebugMode) {
    //   print(
    //     "========================================================================$response");
    // }
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     items.addAll(response['data']);
    //   } else {
    //     statusRequest = StatusRequest.failure;
    //   }
    // }
    // update();
  }

  @override
  changeCat( val,catVal) {
    selectedCat =val;
    catId =catVal;
    getData(catId!);
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails,arguments: {
      "itemsModel":itemsModel
    });
  }
}
