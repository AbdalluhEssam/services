import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../../controller/home/categoriespro_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/services.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../likeapi.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesProControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(translateDataBase("مقدم الخدمة", "Service provider")),
        ),
        body: GetBuilder<CategoriesProControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: const ListProCat())));
  }
}

class ListProCat extends GetView<CategoriesProControllerImp> {
  const ListProCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return ListProCatCart(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}

class ListProCatCart extends StatelessWidget {
  final ItemsModel itemsModel;

  const ListProCatCart({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productDetails, arguments: {
          "id": int.parse(itemsModel.itemsId!),
          "name": myServices.sharedPreferences.getString("lang") == "en"
              ? itemsModel.itemsName
              : itemsModel.itemsNameAr,
          "image": itemsModel.itemsImage,
          "desc": myServices.sharedPreferences.getString("lang") == "en"
              ? itemsModel.itemsDesc
              : itemsModel.itemsDescAr,
        });
      },
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColor.secoundColorBack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                fit: BoxFit.cover,
                width: Get.width * 0.5,
                // width: Get.width,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${translateDataBase(itemsModel.categoriesNameAr, itemsModel.categoriesName)}",
                            style:  TextStyle(
                                fontSize: 12, height: 1, color: AppColor.primaryColor.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.primaryColor),
                              side: MaterialStatePropertyAll(BorderSide.none)),
                          onPressed: () {
                            // controller.addCart("${itemsModel.itemsId}");
                          },
                          child: Text(
                            translateDataBase("احجز", "Booking"),
                            style: const TextStyle(
                                color: AppColor.backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
