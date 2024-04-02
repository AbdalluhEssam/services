import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/data/model/categories_model.dart';
import '../../../controller/home/carproservies_controller.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';

class ProductView extends GetView<HomeControllerImp> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: Get.width * 0.25,
      width: Get.width * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return ProductCard(
              categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final CategoriesModel categoriesModel;

  const ProductCard({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(CategoriesProServicesControllerImp());
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                color: AppColor.backgroundColor,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: myServices.sharedPreferences.getString("lang") == "en"
                  ? Text(
                      "${categoriesModel.categoriesName}",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  : Text(
                      "${categoriesModel.categoriesNameAr}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
