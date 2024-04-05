import 'package:get/get.dart';
import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';
import '../../../../core/services/services.dart';

class CheckOutViewData {
  Crud crud;
  MyServices myServices = Get.find();

  CheckOutViewData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.orderView, {
      "id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
class OrderGlusViewData {
  Crud crud;
  MyServices myServices = Get.find();

  OrderGlusViewData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.orderViewGlus, {
      "users_id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}


class CheckOutAddData {
  Crud crud;
  MyServices myServices = Get.find();
  CheckOutAddData(this.crud);
  postData( String address,String ordersCoupon, String total,String delivery) async {
    var response = await crud.postData(AppLink.checkOutAdd, {
      "user_id": myServices.sharedPreferences.getString("id").toString(),
      "address" : address,
      "orders_coupon": ordersCoupon,
      "total_price" : total,
      "delivery" : delivery,
    });
    return response.fold((l) => l, (r) => r);
  }
}

