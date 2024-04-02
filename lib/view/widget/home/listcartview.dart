import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/data/model/cart_model.dart';
import '../../../controller/cart/cardview_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';

class ListCart extends GetView<CardViewControllerImp> {
  const ListCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardViewControllerImp());
    return GetBuilder<CardViewControllerImp>(
        init: Get.put(CardViewControllerImp()),
        builder: (controller) => ListView.separated(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.cart.length,
              itemBuilder: (context, index) {
                return ListCartView(
                  cartModel: CartModel.fromJson(controller.cart[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
            ));
  }
}

class ListCartView extends StatelessWidget {
  final CartModel cartModel;

  const ListCartView({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    int q;
    Get.put(CardViewControllerImp());
    return GetBuilder<CardViewControllerImp>(
        init: Get.put(CardViewControllerImp()),
        builder: (controller) => InkWell(
              onTap: () {
                Get.toNamed(AppRoute.productDetails, arguments: {
                  "id": int.parse(cartModel.itemsId!),
                  "name": myServices.sharedPreferences.getString("lang") == "en"
                      ? cartModel.itemsName
                      : cartModel.itemsNameAr,
                  "price": int.parse(cartModel.itemsPrice!),
                  "image": cartModel.itemsImage,
                  "desc": myServices.sharedPreferences.getString("lang") == "en"
                      ? cartModel.itemsDesc
                      : cartModel.itemsDescAr,
                });
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderOnForeground: true,
                shadowColor: AppColor.black,
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: AppColor.backgroundColor,
                      width: Get.width * 0.33,
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${cartModel.itemsImage}",
                        height: Get.width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${translateDataBase(cartModel.itemsNameAr, cartModel.itemsName)}",
                              style: const TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${cartModel.itemsPrice}" " ${translateDataBase("جنية", "EG")}",
                              style: const TextStyle(
                                  fontSize: 16, color: AppColor.primaryColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Get.width * 0.1,
                                      width: Get.width * 0.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: AppColor.primaryColor,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          q = (int.parse(cartModel.quantity!) +
                                              1);
                                          controller.editData(
                                              int.parse(cartModel.cartId!), q);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${cartModel.quantity}",
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: Get.width * 0.1,
                                      width: Get.width * 0.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: AppColor.primaryColor,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          if (int.parse(cartModel.quantity!) <=
                                              1) {
                                            Get.snackbar(
                                              "${controller.myServices.sharedPreferences.getString("username")}",
                                              "count".tr,
                                              icon: const Icon(
                                                  Icons.access_alarm),
                                              barBlur: 2,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              backgroundColor: AppColor
                                                  .primaryColor
                                                  .withOpacity(0.4),
                                              isDismissible: true,
                                              duration:
                                                  const Duration(seconds: 3),
                                              borderRadius: 80,
                                              colorText: AppColor.black,
                                            );
                                          } else {
                                            q = (int.parse(
                                                    cartModel.quantity!) -
                                                1);
                                            controller.editData(
                                                int.parse(cartModel.cartId!),
                                                q);
                                          }
                                        },
                                        padding: EdgeInsets.only(
                                          bottom: Get.width * 0.1,
                                        ),
                                        icon: const Icon(
                                          Icons.minimize_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      controller.deleteData(
                                          int.parse(cartModel.cartId!));
                                    },
                                    icon: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}
