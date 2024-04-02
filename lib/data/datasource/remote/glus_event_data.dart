import 'package:get/get.dart';
import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';
import '../../../core/services/services.dart';

class GlusEventData {
  Crud crud;
  MyServices myServices = Get.find();

  GlusEventData(this.crud);
  addData(String ordersAddressId,String serviceType,String data,String hour,String clientNote) async {
    var response = await crud.postData(AppLink.glusEvent, {
      "orders_usersid": myServices.sharedPreferences.getString("id").toString(),
      "orders_addressid": ordersAddressId.toString(),
      "service_type": serviceType.toString(),
      "data": data.toString(),
      "hour": hour.toString(),
      "client_note": clientNote.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}

