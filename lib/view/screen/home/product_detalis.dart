import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import '../../../controller/home/productdetalis_controller.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColor.kBackgroundColor),
          backgroundColor: AppColor.kBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.myHomePageCart);
              },
              icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
        backgroundColor: AppColor.bg,
        bottomNavigationBar: controller.count == 0
            ? Container(
                color: AppColor.primaryColor,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                // padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "notavailable".tr,
                  style: const TextStyle(
                      color: AppColor.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(
                width: double.infinity,
                // color: Colors.brown[200],
                margin:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(15),
                  color: AppColor.kSecondaryColor,
                  onPressed: () {
                    controller.addCart(controller.idProduct.toString());
                  },
                  textColor: Colors.white,
                  child: Text("addcart".tr),
                ),
              ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  decoration: const BoxDecoration(
                    color: AppColor.kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ProductImage(
                          size: size,
                          image:
                              "${AppLink.imageItems}/${controller.imageProduct}",
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: const [
                      //       ColorDot(
                      //         fillColor: AppColor.kTextLightColor,
                      //         isSelected: true,
                      //       ),
                      //       ColorDot(
                      //         fillColor: Colors.blue,
                      //         isSelected: false,
                      //       ),
                      //       ColorDot(
                      //         fillColor: Colors.red,
                      //         isSelected: false,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20 / 2),
                        child: Text(
                          "${controller.nameProduct}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      controller.priceProduct == 0
                          ? Text(
                              "priceglus".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.kSecondaryColor,
                              ),
                            )
                          : Text(
                              myServices.sharedPreferences.getString("lang") ==
                                      "en"
                                  ? "Price ${controller.priceProduct} EG"
                                  : "السعر ${controller.priceProduct} جنية ",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColor.kSecondaryColor,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    controller.descProduct,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            )
          ],
        ));
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.fillColor,
    required this.isSelected,
  }) : super(key: key);

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20 / 2.5),
      padding: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isSelected ? AppColor.kTextLightColor : Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(200)),
      height: size.width * 0.7,
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.center,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            child: CachedNetworkImage(
              imageUrl: image,
              alignment: Alignment.center,
              height: size.width * 0.62,
              width: size.width * 0.62,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
