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
class OrderDetViewData {
  Crud crud;
  MyServices myServices = Get.find();

  OrderDetViewData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.orderDetView, {
      "order_id": id,
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
class CheckOutGlusAddData {
  Crud crud;
  MyServices myServices = Get.find();
  CheckOutGlusAddData(this.crud);
  postData(String total,String address, String countR,String count , String countK , String countB ,String count_balcony,String note,String id) async {
    var response = await crud.postData(AppLink.checkOutGlusAdd, {
      "users_id": myServices.sharedPreferences.getString("id").toString(),
      "total_price_order" : total,
      "address" : address,
      "count_r": countR,
      "count_room": count,
      "count_k": countK,
      "count_b": countB,
      "count_balcony": count_balcony,
      "note": note,
      "g_id" : id

    });
    return response.fold((l) => l, (r) => r);
  }
}

