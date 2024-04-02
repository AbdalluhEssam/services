import 'package:get/get.dart';
import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';
import '../../../core/services/services.dart';

class CardViewData {
  Crud crud;
  MyServices myServices = Get.find();

  CardViewData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.cardView, {
      "id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.cardDelete, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.couponView, {
      "couponname": couponName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  editData(String id,String q) async {
    var response = await crud.postData(AppLink.cardEdit, {
      "cart_id": id.toString(),
      "user_id": myServices.sharedPreferences.getString("id").toString(),
      "quantity" :q.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  addData(String itemId) async {
    var response = await crud.postData(AppLink.cardAdd, {
      "items_id": itemId.toString(),
      "user_id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  cardDelData() async {
    var response = await crud.postData(AppLink.del, {
      "id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}

