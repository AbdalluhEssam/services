import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/search_controller.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/data/model/itemsmodel.dart';
import 'package:services/likeapi.dart';
import 'package:http/http.dart' as http;
import '../../../controller/home/categoriespro_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../data/datasource/remote/homedata.dart';

class SearchScreen extends SearchDelegate {
  SearchControllerImp controller = Get.put(SearchControllerImp());
  List search = [];
  SenpData senpData = SenpData(Get.find());
  SearchData searchData = SearchData(Get.find());
  late StatusRequest statusRequest;

  Future getItemsData() async {
    var response =
        await http.post(Uri.parse(AppLink.senp), body: {"query": query});
    if (response.statusCode == 200) {
      var itemData = jsonDecode(response.body);
      if (kDebugMode) {
        print(
            "========================================================================$itemData");
      }
      return itemData;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    getItemsData();
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getItemsData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("لا يوجد"),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetails, arguments: {
                    "id": int.parse(snapshot.data[i]['items_id']),
                    "name": snapshot.data[i]['items_name_ar'],
                    "image": snapshot.data[i]['items_image'],
                    "price": int.parse(snapshot.data[i]['items_price']),
                    "desc": snapshot.data[i]['items_desc_ar'],
                    "count": int.parse(snapshot.data[i]['items_count']),
                  });
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imageItems}/${snapshot.data[i]['items_image']}",
                            fit: BoxFit.cover,
                            width: Get.width * 0.2,
                            height: Get.width * 0.3,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data[i]['items_name_ar']}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            MaterialButton(minWidth: 350,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              color: AppColor.primaryColor,
                              onPressed: () {
                                // controller.addCart(controller.itemsModel.itemsId.toString());
                                Get.toNamed(AppRoute.productDetails,arguments: {
                                  "itemsModel" : ItemsModel.fromJson(snapshot.data[i]),
                                });
                              },
                              textColor: Colors.white,
                              child: Text(
                                translateDataBase("احجز الان", "Book now"),
                                style:
                                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var search = query.isEmpty
        ? controller.search
        : controller.search.where((element) =>
            element["items_name_ar"].toString().toLowerCase().contains(query));
    return ListView.builder(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: search.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = search.toList()[index]['items_name_ar'];
                showResults(context);
              },
              leading: const Icon(Icons.search),
              title: Text("${search.toList()[index]['items_name_ar']}"),
            ));
  }
}
