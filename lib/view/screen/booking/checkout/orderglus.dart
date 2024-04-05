import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:intl/intl.dart';
import 'package:services/data/model/booking_model.dart';
import '../../../../controller/cart/orderviewglus_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../likeapi.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewGlusControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("${translateDataBase("عرض الحجوزات", "Booking View")}"),
          automaticallyImplyLeading: false,
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
      itemCount: controller.bookings.length,
      itemBuilder: (context, index) {
        return ListCartView(
          bookingModel: BookingModel.fromJson(controller.bookings[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 12,
      ),
    );
  }
}

class ListCartView extends StatelessWidget {
  final BookingModel bookingModel;

  const ListCartView({Key? key, required this.bookingModel}) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "idorder".tr,
                            ),
                            Text(
                              " : ${bookingModel.bookingId}",
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                                "${translateDataBase("اسمك العامل", "Working name")}"),
                            Text(
                              " : ${translateDataBase(bookingModel.itemsNameAr!, bookingModel.itemsName!)}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "${translateDataBase("اسم العنوان", "Name Title")}"),
                            Text(
                              " : ${bookingModel.addressName}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "${translateDataBase("العنوان بالتفصيل", "Detailed address")}"),
                            Text(
                              " : ${bookingModel.addressStreet}",
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "total".tr,
                        //       style: const TextStyle(fontSize: 12),
                        //     ),
                        //     Text(
                        //       double.parse(bookingModel
                        //           .totalPriceOrder!) ==
                        //           double.parse(
                        //               bookingModel.totalPrice!)
                        //           ? " : سيتم تحديد السعر من خلال خدمة العملاء"
                        //           : " : ${bookingModel.totalPriceOrder!}",
                        //       style: const TextStyle(fontSize: 12),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "notede".tr,
                              ),
                            ),
                            Text(
                              bookingModel.note! == ''
                                  ? translateDataBase("لا يوجد", "Nothing")
                                  : bookingModel.note!,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                              .format(DateTime.parse(bookingModel.createAt!))
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
                        color: int.parse(bookingModel.status!) == 1
                            ? AppColor.primaryColor
                            : int.parse(bookingModel.status!) == 2
                                ? Colors.green
                                : int.parse(bookingModel.status!) == 3
                                    ? AppColor.bg.withOpacity(0.5)
                                    : int.parse(bookingModel.status!) == 5
                                        ? Colors.greenAccent
                                        : Colors.red),
                    child: Text(
                      int.parse(bookingModel.status!) == 1
                          ? "1".tr
                          : int.parse(bookingModel.status!) == 2
                              ? "2".tr
                              : int.parse(bookingModel.status!) == 3
                                  ? "3".tr
                                  : int.parse(bookingModel.status!) == 5
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
