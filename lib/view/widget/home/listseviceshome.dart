import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/data/model/categories_model.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';

class ListServicesHome extends GetView<HomeControllerImp> {
  const ListServicesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: Get.width * 0.25,
      width: Get.width * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Services(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Services extends StatelessWidget {
  final CategoriesModel categoriesModel;

  const Services({
    Key? key,
    required this.categoriesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return InkWell(
        onTap: () {
          Get.toNamed(AppRoute.productScreen, arguments: {
            "id": categoriesModel.categoriesId,
            "name": categoriesModel.categoriesName,
            "image": categoriesModel.categoriesImage,
          });
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColor.backgroundColor.withOpacity(0.9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: Get.width * 0.25,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
                    // color: AppColor.secoundColor,
                  ),
                ),
                myServices.sharedPreferences.getString("lang") == "en"
                    ? Text(
                        "${categoriesModel.categoriesName}",
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.primaryColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        "${categoriesModel.categoriesNameAr}",
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.primaryColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ],
            ),
          ),
        ));
  }
}
