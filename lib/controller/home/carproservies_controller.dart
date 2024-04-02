import 'package:get/get.dart';
import 'package:services/core/services/services.dart';
import 'package:services/data/datasource/remote/carpro_data.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';


abstract class CategoriesProServicesController extends GetxController {
  initialData();
  getData();
}

class CategoriesProServicesControllerImp
    extends CategoriesProServicesController {
  MyServices myServices = Get.find();
  CatProServicesData catProServicesData = CatProServicesData(Get.find());

  List categories = [];

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? idSer;
  String? name;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await catProServicesData.postData(idSer.toString());
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
