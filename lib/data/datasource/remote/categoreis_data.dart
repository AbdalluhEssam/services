import 'dart:io';

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

  addProduct(
    String name,
    String nameAr,
    String itemsDesc,
    String itemsDescAr,
    String itemsActive,
    String itemsDescount,
    String itemsCat,
    File? file,
  ) async {
    var response = await crud.postRequestWithImage(
        AppLink.addProduct,
        {
          "items_name": name.toString(),
          "items_name_ar": nameAr.toString(),
          "items_desc": itemsDesc.toString(),
          "items_desc_ar": itemsDescAr.toString(),
          "items_active": itemsActive.toString(),
          "items_descount": itemsDescount.toString(),
          "items_cat": itemsCat.toString(),
        },
        file!,
        "file");
    return response;
  }

  deleteProduct(String idPro, String image) async {
    var response = await crud.postData(AppLink.deleteProduct, {
      "id": idPro,
      "items_image": image,
    });
    return response.fold((l) => l, (r) => r);
  }
}
