import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/checkout_data.dart';

abstract class OrderViewController extends GetxController {
  initialData();

  getData();

}

class OrderViewControllerImp extends OrderViewController {
  MyServices myServices = Get.find();
  CheckOutViewData orderViewData = CheckOutViewData(Get.find());

  List order = [];

  double get price => totalPrice;
  double totalPrice = 0.0;

  num get quantity => totalQuantity;
  num totalQuantity = 0;
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
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderViewData.getData();
    print(
        "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        order.addAll(response['orders']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    print(
        "==============================================================================${order.length}");
    update();
  }



}