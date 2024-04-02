import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.addressView, {
      "address_usersid": id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "address_id": id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  addAddressData(
      String userId,
      String addressName,
      String addressCityId,
      String addressStreet,
      String addressLat,
      String addressLong) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "address_usersid": userId.toString(),
      "address_name": addressName.toString(),
      "address_city": addressCityId.toString(),
      "address_street": addressStreet.toString(),
      "address_lat": addressLat.toString(),
      "address_long": addressLong.toString(),

    });
    return response.fold((l) => l, (r) => r);
  }
}

class GovernoratesData {
  Crud crud;

  GovernoratesData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.governoratesView, {});
    return response.fold((l) => l, (r) => r);
  }
}
