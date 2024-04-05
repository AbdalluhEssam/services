import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../../controller/cart/checkoutglus_controller.dart';
import '../../../core/constant/routes.dart';
import '../../widget/checkout/cardaddress.dart';
import '../../widget/checkout/custombuttoncheckout.dart';

class CheckOutGlus extends StatelessWidget {
  const CheckOutGlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutGlusControllerImp());
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text("addservice".tr),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
        ),
        body: GetBuilder<CheckOutGlusControllerImp>(
            builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text("choosepaymentmethod".tr,
                            textAlign: TextAlign.end),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: "soon".tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColor.primaryColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/credit.png",
                                      width: 180,
                                      height: 100,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text("electronicpayment".tr),
                                  ],
                                ),
                              ),
                              Container(
                                color: AppColor.gray.withOpacity(0.1),
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/images/cash.png",
                                        width: 180,
                                        height: 100,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text("shipping".tr),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            key: controller.formState,
                            child: Column(
                              children: [
                                GetBuilder<CheckOutGlusControllerImp>(builder: (controller) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "shippingaddress".tr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 12),
                                    Visibility(
                                      visible: controller.address.isEmpty,
                                      child: Card(
                                          child: TextButton.icon(
                                            onPressed: () {
                                              Get.toNamed(AppRoute.addressAdd,arguments: {
                                                "currentRoute" : Get.currentRoute
                                              });
                                            },
                                            label:  Text("addaddress".tr),
                                            icon: const Icon(Icons
                                                .add_location_alt_outlined),
                                          )),
                                    ),
                                    if (controller.address.isEmpty)
                                      const LinearProgressIndicator(),
                                    ...List.generate(
                                      controller.address.length,
                                          (index) =>  InkWell(
                                        onTap: () {
                                          controller
                                              .chooseShippingAddresss(
                                              controller
                                                  .address[index]
                                                  .addressId!,
                                              controller
                                                  .address[index]
                                                  .delivery!);
                                        },
                                        child: CardAddressCheckOut(
                                            title:
                                            "${controller.address[index].addressName}",
                                            body:
                                            "${controller.address[index].addressStreet}",
                                            isActive: controller
                                                .addressId ==
                                                controller
                                                    .address[index]
                                                    .addressId
                                                ? true
                                                : false),
                                      ),
                                    )
                                  ],
                                ),),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "🇪🇬 +2 ${controller.myServices.sharedPreferences.getString("phone")}"),
                                      const Icon(Icons.phone,
                                          color: AppColor.gray),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 5,
                          width: 320,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                             Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text("delivery".tr),
                                            Text("${translateDataBase("اسمك العامل", "Working name")}"),
                                            Text("${translateDataBase("نوع الخدمة", "Service type")}"),
                                            Text("${translateDataBase("وقت الخدمة", "Service time")}"),
                                            // Text("total".tr),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            // Text("${controller.delivery}"),
                                            Text("${translateDataBase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}"),
                                            Text("${translateDataBase(controller.itemsModel.categoriesNameAr, controller.itemsModel.categoriesName)}"),
                                            Text("${DateFormat.yMMMEd().format(DateTime.parse(controller.focusDate!))} ${controller.timeHour}"),
                                            // Text("${controller.total} EG"),
                                          ],
                                        ),
                                      ],
                                    )

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 5,
                          width: 320,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "deliverytime".tr,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(Icons.alarm)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtonCheckOut(
                            text: "confirmorder".tr,
                            onPressed: () {
                              controller.saveOrder();
                            }),
                      ],
                    ),
                  ],
                ))));
  }
}
