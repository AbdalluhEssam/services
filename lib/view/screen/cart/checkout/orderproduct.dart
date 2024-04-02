import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/cart/order_controller.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:intl/intl.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../data/model/order_model.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("orders".tr),
          centerTitle: true,
        ),
        body: GetBuilder<OrderViewControllerImp>(
            init: Get.put(OrderViewControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const ListOrder()))));
  }
}

class ListOrder extends GetView<OrderViewControllerImp> {
  const ListOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.order.length,
        itemBuilder: (context, index) {
          return ListCartView(
            orderModel: OrderModel.fromJson(controller.order[index]),
          );
        },
        // separatorBuilder: (BuildContext context, double index) => const SizedBox(
        //   height: 12,
        // ),
      ),
    );
  }
}

class ListCartView extends StatelessWidget {
  final OrderModel orderModel;

  const ListCartView({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewControllerImp());
    return GetBuilder<OrderViewControllerImp>(
        builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 30,
                    color: AppColor.black.withOpacity(0.05),
                    spreadRadius: 0,
                    offset: const Offset(12, 12))
              ]),
              child: Card(
                elevation: 3,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${"idorder".tr} : #${orderModel.orderId}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMEd()
                                .format(DateTime.parse(orderModel.orderDate!)),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.black),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${translateDataBase("اسم عنوانك : ", "Address Name : ")} : ${orderModel.addressName}"),
                              Text(
                                  "${"addressYou".tr} : ${orderModel.addressStreet}"),
                              Text("${"delivery".tr} : ${orderModel.delivery}"
                                  " ${translateDataBase("جنية", "EG")}"),
                              Text(
                                "${translateDataBase("السعر", "Price")} : ${controller.myServices.formatNumber(orderModel.totalPrice)}"
                                " ${translateDataBase("جنية", "EG")}",
                              ),
                            ],
                          ),
                          Container(
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: double.parse(
                                              orderModel.orderApprove!) ==
                                          1
                                      ? AppColor.primaryColor
                                      : double.parse(
                                                  orderModel.orderApprove!) ==
                                              2
                                          ? Colors.green
                                          : double.parse(orderModel
                                                      .orderApprove!) ==
                                                  3
                                              ? AppColor.bg.withOpacity(0.5)
                                              : double.parse(orderModel
                                                          .orderApprove!) ==
                                                      4
                                                  ? Colors.greenAccent
                                                  : Colors.red),
                              child: Text(
                                double.parse(orderModel.orderApprove!) == 1
                                    ? "1".tr
                                    : double.parse(orderModel.orderApprove!) ==
                                            2
                                        ? "2".tr
                                        : double.parse(
                                                    orderModel.orderApprove!) ==
                                                3
                                            ? "3".tr
                                            : double.parse(orderModel
                                                        .orderApprove!) ==
                                                    4
                                                ? "4".tr
                                                : "0".tr,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${"total".tr} : ${controller.myServices.formatNumber((double.parse(orderModel.totalPrice!) + double.parse(orderModel.delivery!)).toString())}"
                            " ${translateDataBase("جنية", "EG")}",
                            style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.orderDet, arguments: {
                                  "orderModel": orderModel,
                                  "order_id": double.parse(orderModel.orderId!),
                                });
                              },
                              child: Text("Order Details".tr)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

// InkWell(
// onTap: () {
// Get.toNamed(AppRoute.orderDet, arguments: {
// "order_id": double.parse(orderModel.orderId!),
// "orderModel": orderModel,
// });
// },
// child: Container(
// margin: const EdgeInsets.symmetric(vertical: 5),
// decoration: BoxDecoration(boxShadow: [
// BoxShadow(
// blurRadius: 30,
// color: AppColor.black.withOpacity(0.05),
// spreadRadius: 0,
// offset: const Offset(12, 12))
// ]),
// child: Card(
// clipBehavior: Clip.antiAliasWithSaveLayer,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// elevation: 3,
// child: Wrap(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 15, vertical: 1),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Expanded(
// flex: 2,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text("idorder".tr,
// style:
// const TextStyle(fontSize: 12)),
// Text(" : ${orderModel.orderId}",
// style:
// const TextStyle(fontSize: 12)),
// ],
// ),
// Row(
// children: [
// Text(
// "total".tr,
// style: const TextStyle(fontSize: 12),
// ),
// Text(
// " : ${double.parse(orderModel.totalPrice!).toPrecision(2)}",
// style: const TextStyle(fontSize: 12),
// ),
// ],
// ),
// ],
// ),
// ),
// Expanded(
// child: Container(
// padding: const EdgeInsets.all(5),
// alignment: Alignment.center,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: double.parse(
// orderModel.orderApprove!) ==
// 1
// ? AppColor.primaryColor
//     : double.parse(orderModel
//     .orderApprove!) ==
// 2
// ? Colors.green
//     : double.parse(orderModel
//     .orderApprove!) ==
// 3
// ? AppColor.bg.withOpacity(0.5)
//     : double.parse(orderModel
//     .orderApprove!) ==
// 4
// ? Colors.greenAccent
//     : Colors.red),
// child: Text(
// double.parse(orderModel.orderApprove!) == 1
// ? "1".tr
//     : double.parse(
// orderModel.orderApprove!) ==
// 2
// ? "2".tr
//     : double.parse(orderModel
//     .orderApprove!) ==
// 3
// ? "3".tr
//     : double.parse(orderModel
//     .orderApprove!) ==
// 4
// ? "4".tr
//     : "0".tr,
// style: const TextStyle(fontSize: 12),
// textAlign: TextAlign.center,
// ),
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 12),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "requesttime".tr,
// style: const TextStyle(fontSize: 12),
// ),
// Text(
// DateFormat.yMMMEd()
//     .format(
// DateTime.parse(orderModel.orderDate!))
//     .toString(),
// style: const TextStyle(fontSize: 12),
// ),
// ],
// ),
// ),
// ],
// ),
// )),
// )
