import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import '../../../controller/cart/cardview_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/home/listcartview.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardViewControllerImp());
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CardViewControllerImp>(
        init: Get.put(CardViewControllerImp()),
        builder: (controller) => HandlingDataViewNot(
            statusRequest: controller.statusRequest,
            widget: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text("shopping cart".tr),
                ),
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GetBuilder<CardViewControllerImp>(
                      builder: (controller) => controller.couponName == null
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      cursorColor: AppColor.primaryColor,
                                      style: const TextStyle(
                                          color: AppColor.primaryColor),
                                      controller: controller.myControllerCoupon,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        fillColor: AppColor.primaryColor,
                                        focusColor: AppColor.primaryColor,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 8),
                                        labelStyle: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        hintStyle: const TextStyle(
                                            color: AppColor.backgroundColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.primaryColor,
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.primaryColor,
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColor.primaryColor,
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                        hintText: "entercoupon".tr,
                                        helperStyle:
                                            const TextStyle(fontSize: 14),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        label: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text("entercoupon".tr)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: CustomButtonCart(
                                        text: "apply".tr,
                                        onPressed: () {
                                          controller.checkCoupon();
                                        },
                                      ))
                                ],
                              ),
                            )
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "couponName".tr,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 16),
                                  ),
                                  Text("${controller.couponName}",
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 16))
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "total".tr,
                                style: const TextStyle(
                                    fontSize: 22, color: AppColor.gray),
                              ),
                              Text(
                                "${controller.totalPrice}",
                                style: const TextStyle(
                                    fontSize: 18, color: AppColor.primaryColor),
                              )
                            ],
                          ),
                          // const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: size.width * 0.4,
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoute.checkOut, arguments: {
                                      "total": controller.totalPrice,
                                      "quantity": controller.totalQuantity,
                                      "couponId": controller.couponId ?? "0",
                                      "discountcoupon":
                                          controller.discountCoupon.toString(),
                                    });
                                  },
                                  color: AppColor.primaryColor,
                                  textColor: Colors.white,
                                  child: Text(
                                    "checkout".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                body: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const ListCart(),
                ))));
  }
}

class CustomButtonCart extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonCart({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColor.primaryColor,
      textColor: AppColor.backgroundColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.backgroundColor,
            fontSize: 17),
      ),
    );
  }
}
