import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';

class CatProServicesData {
  Crud crud;
  CatProServicesData(this.crud);
  postData(String idSer) async {
    var response = await crud.postData(AppLink.catSerPage, {
      // "cat_services": idSer,
    });
    return response.fold((l) => l, (r) => r);
  }
}
class GlusProServicesData {
  Crud crud;
  GlusProServicesData(this.crud);
  postData(String idSer) async {
    var response = await crud.postData(AppLink.glusSerPage, {
      "glus_ser": idSer,
    });
    return response.fold((l) => l, (r) => r);
  }
  glusAdditionsData(String typesId) async {
    var response = await crud.postData(AppLink.glusAdditions, {
      "types_id": typesId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
