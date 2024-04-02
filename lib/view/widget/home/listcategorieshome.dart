import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/likeapi.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/categories_model.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return CategoriesHome(
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]));
          }),
    );
  }
}

class CategoriesHome extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoriesHome({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          Get.toNamed(AppRoute.productScreen, arguments: {
            "id": categoriesModel.categoriesId,
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // color: AppColor.primaryColor,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 100,
          width: 180,
          child: Image.network(
            "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
          ),
        ),
      ),
      Text(
        "${categoriesModel.categoriesName}",
        style: const TextStyle(fontSize: 15),
      )
    ]);
  }
}
