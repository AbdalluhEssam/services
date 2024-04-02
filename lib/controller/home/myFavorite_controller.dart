import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/myfavorite_data.dart';
import '../../data/model/myfavorite_model.dart';

abstract class MyFavoriteController extends GetxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> favorite = [];

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
    favorite.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData();
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List re = response['data'];
        favorite.addAll(re.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String id) {
    var response = myFavoriteData.deleteData(id.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
      favorite.removeWhere(
        (element) => element.favoriteId == id,
      );

    update();
  }

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
