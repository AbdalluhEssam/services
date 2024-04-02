import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/view/screen/home/product.dart';
import '../../../controller/home/carproservies_controller.dart';
import '../../../core/class/handlingdataview.dart';

class ServicesHome extends StatelessWidget {
  const ServicesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesProServicesControllerImp controller= Get.put(CategoriesProServicesControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.name.toString()),
        ),
        body: GetBuilder<CategoriesProServicesControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: const ProductView())));
  }
}
