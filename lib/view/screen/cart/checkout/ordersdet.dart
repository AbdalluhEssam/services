import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import '../../../../controller/cart/orderdet_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/translatedordatabase.dart';
import 'listorderdet.dart';

class OrderDetScreen extends StatelessWidget {
  const OrderDetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetViewControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("orders".tr),
        ),
        body: GetBuilder<OrderDetViewControllerImp>(
            init: Get.put(OrderDetViewControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const ListDetOrder(),
                      Text(
                        "${"total".tr} : ${controller.myServices.formatNumber(controller.orderModel.totalPrice)}"
                            " ${translateDataBase("جنية", "EG")}",
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))));
  }
}
