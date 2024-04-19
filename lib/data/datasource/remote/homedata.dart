import 'dart:io';

import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  Future getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addCategories(String name,String nameAr, File? file) async {
    var response = await crud.postRequestWithImage(
        AppLink.addCategories,
        {
          "categories_name": name.toString(),
          "categories_name_ar": nameAr.toString()
        },
        file!,
        "file");
    return response;
  }
  addBanner(String name, File? file) async {
    var response = await crud.postRequestWithImage(
        AppLink.addBanner,
        {
          "banner_name": name.toString(),
        },
        file!,
        "file");
    return response;
  }
}

class SearchData {
  Crud crud;

  SearchData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.searchPage, {});
    return response.fold((l) => l, (r) => r);
  }
}

class SenpData {
  Crud crud;

  SenpData(this.crud);

  getData(String q) async {
    var response = await crud.postData(AppLink.senp, {"query": q.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
