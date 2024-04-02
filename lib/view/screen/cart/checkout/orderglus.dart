import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:services/data/model/orderglus_model.dart';
import 'package:intl/intl.dart';
import '../../../../controller/cart/orderviewglus_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';

class OrderGlus extends StatelessWidget {
  const OrderGlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewGlusControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("orders".tr),
        ),
        body: GetBuilder<OrderViewGlusControllerImp>(
            init: Get.put(OrderViewGlusControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const ListOrder()))));
  }
}

class ListOrder extends GetView<OrderViewGlusControllerImp> {
  const ListOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.orderGlus.length,
      itemBuilder: (context, index) {
        return ListCartView(
          orderGlusModel: OrderGlusModel.fromJson(controller.orderGlus[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 12,
      ),
    );
  }
}

class ListCartView extends StatelessWidget {
  final OrderGlusModel orderGlusModel;

  const ListCartView({Key? key, required this.orderGlusModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewGlusControllerImp());
    return GetBuilder<OrderViewGlusControllerImp>(
        builder: (controller) => Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  color: AppColor.black.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: const Offset(12, 12))
            ]),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 3,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8),child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("idorder".tr,
                              style: const TextStyle(fontSize: 12)),
                          Text(" : ${orderGlusModel.orderGlusId}",
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      if (int.parse(orderGlusModel.idGluspro!) <= 2)
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "res".tr,
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " : ${orderGlusModel.countR}",
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "room".tr,
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " : ${orderGlusModel.countRoom}",
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "kitchen".tr,
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " : ${orderGlusModel.countK}",
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "bathroom".tr,
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " : ${orderGlusModel.countB}",
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "balconies".tr,
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " : ${orderGlusModel.countBalcony}",
                                  style:
                                  const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          Text(
                            "type".tr,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            " : ${translateDataBase(orderGlusModel.productNameAr!, orderGlusModel.productName!)}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "total".tr,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            double.parse(orderGlusModel
                                .totalPriceOrder!) ==
                                double.parse(
                                    orderGlusModel.totalPrice!)
                                ? " : سيتم تحديد السعر من خلال خدمة العملاء"
                                : " : ${orderGlusModel.totalPriceOrder!}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "notede".tr,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          Text(
                            orderGlusModel.note! == '' ? translateDataBase("لا يوجد", "Nothing") : orderGlusModel.note!,
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "requesttime".tr,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.parse(orderGlusModel.orderDate!))
                              .toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: int.parse(orderGlusModel.orderApprove!) == 1
                            ? AppColor.primaryColor
                            : int.parse(orderGlusModel.orderApprove!) == 2
                                ? Colors.green
                                : int.parse(orderGlusModel.orderApprove!) == 3
                                    ? AppColor.bg.withOpacity(0.5)
                                    : int.parse(orderGlusModel.orderApprove!) ==
                                            5
                                        ? Colors.greenAccent
                                        : Colors.red),
                    child: Text(
                      int.parse(orderGlusModel.orderApprove!) == 1
                          ? "1".tr
                          : int.parse(orderGlusModel.orderApprove!) == 2
                              ? "2".tr
                              : int.parse(orderGlusModel.orderApprove!) == 3
                                  ? "3".tr
                                  : int.parse(orderGlusModel.orderApprove!) == 5
                                      ? "5".tr
                                      : "0".tr,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )));
  }
}
