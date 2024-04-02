import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';

class CategoriesProData {
  Crud crud;
  CategoriesProData(this.crud);
  postData(String idPro) async {
    var response = await crud.postData(AppLink.catPage, {
      "items_cat": idPro,
    });
    return response.fold((l) => l, (r) => r);
  }
}
