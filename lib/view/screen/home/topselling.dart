import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/data/model/booking_model.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';

class ItemsViewTopSelling extends GetView<HomeControllerImp> {
  const ItemsViewTopSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(15),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.itemsTopSelling.length,
      itemBuilder: ((context, index) => ListItemsView(
          itemsModel: ItemsTopSellingModel.fromJson(
              controller.itemsTopSelling[index]))),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}

class ListItemsView extends GetView<HomeControllerImp> {
  final ItemsTopSellingModel itemsModel;

  const ListItemsView({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productTopSellingDetails, arguments: {
          "itemsModel": itemsModel,
          "currentRoute": Get.currentRoute,
        });
      },
      child: Card(
        elevation: 4, // Add shadow
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                translateDataBase(
                  itemsModel.itemsNameAr.toString(),
                  itemsModel.itemsName.toString(),
                ),
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16, // Increase font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
