import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/cart/order_controller.dart';
import 'package:services/data/model/orderdet_model.dart';
import '../../../../controller/cart/orderdet_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatedordatabase.dart';
import '../../../../core/services/services.dart';
import '../../../../likeapi.dart';

class ListDetOrder extends GetView<OrderDetViewControllerImp> {
  const ListDetOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.cart_d.length,
      itemBuilder: (context, index) {
        return ListCartView(
          orderDetModel: OrderDetModel.fromJson(controller.cart_d[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}

class ListCartView extends StatelessWidget {
  final OrderDetModel orderDetModel;

  const ListCartView({Key? key, required this.orderDetModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(OrderViewControllerImp());
    Size size = MediaQuery.of(context).size;
    return GetBuilder<OrderViewControllerImp>(
        builder: (controller) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  color: AppColor.black.withOpacity(0.05),
                  spreadRadius: 0,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: AppColor.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ColoredBox(
                        color: Colors.white,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageItems}/${orderDetModel.itemsImage}",
                          height: size.width * 0.25,
                          width: size.width,
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${translateDataBase(orderDetModel.itemsNameAr, orderDetModel.itemsName)}",
                            style: const TextStyle(fontSize: 16)),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                text: "price".tr,
                              ),
                              const TextSpan(
                                text: " x ",
                              ),
                              TextSpan(
                                text: "quantity".tr,
                              ),
                              const TextSpan(
                                text: " = ",
                              ),
                              TextSpan(
                                text: "total".tr,
                              ),
                            ])),
                        Row(
                          children: [
                            Text(
                              "${orderDetModel.itemsPrice}",
                              style: const TextStyle(
                                  fontSize: 16, color: AppColor.primaryColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("x"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${orderDetModel.quantity}",
                              style: const TextStyle(
                                  fontSize: 16, color: AppColor.primaryColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "=",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${int.parse(orderDetModel.quantity!) * int.parse(orderDetModel.itemsPrice!)}"
                              " ${translateDataBase("جنية", "EG")}",
                              style: const TextStyle(
                                  fontSize: 16, color: AppColor.primaryColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
